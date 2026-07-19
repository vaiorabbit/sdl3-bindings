# coding: utf-8
# Ref.: /SDL3/test/testime.c
require_relative '../lib/sdl3'
require_relative 'util'

WINDOW_W = 640
WINDOW_H = 360

def render_text(renderer, font, text, marked)
  fg = SDL::Color.new
  fg[:r] = 0x20
  fg[:g] = 0x20
  fg[:b] = 0x20
  fg[:a] = 0xFF

  SDL.SetRenderDrawColor(renderer, 0xF0, 0xF0, 0xF0, 0xFF)
  SDL.RenderClear(renderer)

  display = marked.empty? ? text : "#{text}[#{marked}]"
  surface_ptr = SDL.TTF_RenderText_Blended(font, display, display.bytesize, fg)
  if surface_ptr && !surface_ptr.null?
    surface = SDL::Surface.new(surface_ptr)
    texture = SDL.CreateTextureFromSurface(renderer, surface_ptr)
    dst = SDL::FRect.new
    dst[:x] = 24.0
    dst[:y] = (WINDOW_H / 2).to_f
    dst[:w] = surface[:w].to_f
    dst[:h] = surface[:h].to_f
    SDL.RenderTexture(renderer, texture, nil, dst)
    SDL.DestroyTexture(texture)
    SDL.DestroySurface(surface_ptr)
  end

  SDL.RenderPresent(renderer)
end

if __FILE__ == $PROGRAM_NAME
  font_path = ARGV[0] || 'GenShinGothic-Normal.ttf'

  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_VIDEO | SDL::INIT_EVENTS)
  exit unless SDL.TTF_Init()

  window = SDL.CreateWindow('Minimal SDL IME Test via sdl3-bindings', WINDOW_W, WINDOW_H, 0)
  renderer = SDL.CreateRenderer(window, nil)
  font = SDL.TTF_OpenFont(font_path, 30.0)
  exit if font.nil? || font.null?

  text = ''
  marked = ''
  ime_rect = SDL::Rect.new
  ime_rect[:x] = 24
  ime_rect[:y] = WINDOW_H / 2
  ime_rect[:w] = WINDOW_W - 48
  ime_rect[:h] = 48

  SDL.StartTextInput(window)
  SDL.SetTextInputArea(window, ime_rect, 0)
  render_text(renderer, font, text, marked)

  event = SDL::Event.new
  done = false
  until done
    while SDL.PollEvent(event)
      case event[:common][:type]
      when SDL::EVENT_KEY_DOWN
        case event[:key][:key]
        when SDL::SDLK_ESCAPE
          done = true
        when SDL::SDLK_BACKSPACE
          text = text.each_char.to_a[0...-1].join
          render_text(renderer, font, text, marked)
        when SDL::SDLK_RETURN
          text << "\n"
          render_text(renderer, font, text, marked)
        end
      when SDL::EVENT_TEXT_INPUT
        appended = event[:text][:text].read_string
        text << appended
        marked = ''
        render_text(renderer, font, text, marked)
      when SDL::EVENT_TEXT_EDITING
        marked = event[:edit][:text].read_string
        render_text(renderer, font, text, marked)
      when SDL::EVENT_WINDOW_CLOSE_REQUESTED
        done = true
      end
    end
    SDL.Delay(10)
  end

  SDL.StopTextInput(window)
  SDL.TTF_CloseFont(font)
  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.TTF_Quit()
  SDL.Quit()
end
