# coding: utf-8
# Usage : $ ruby test_ttf.rb ./GenShinGothic-Normal.ttf
require_relative '../lib/sdl3'
require_relative 'util'

WINDOW_W = 640
WINDOW_H = 360

def sdl_error_message
  error = SDL.GetError()
  error && !error.null? ? error.read_string : 'unknown SDL error'
end

def abort_with_sdl_error(message)
  $stderr.puts "#{message}: #{sdl_error_message}"
  exit 1
end

if __FILE__ == $PROGRAM_NAME
  if ARGV[0] == nil
    $stderr.puts 'Usage: ruby test_ttf.rb [path to .ttf]'
    exit
  end

  load_sdl3_lib()
  abort_with_sdl_error('SDL.Init failed') unless SDL.Init(SDL::INIT_VIDEO | SDL::INIT_EVENTS)

  window = SDL.CreateWindow("Minimal SDL_TTF Test via sdl3-bindings", WINDOW_W, WINDOW_H, 0)
  abort_with_sdl_error('SDL.CreateWindow failed') if window.nil? || window.null?
  SDL.SetWindowPosition(window, SDL::WINDOWPOS_CENTERED_MASK | 0, SDL::WINDOWPOS_CENTERED_MASK | 0)

  renderer = SDL.CreateRenderer(window, nil)
  abort_with_sdl_error('SDL.CreateRenderer failed') if renderer.nil? || renderer.null?

  abort_with_sdl_error('SDL.TTF_Init failed') unless SDL.TTF_Init()

  font = SDL.TTF_OpenFont(ARGV[0], 42.0)
  abort_with_sdl_error('SDL.TTF_OpenFont failed') if font.nil? || font.null?

  renderstyle = SDL::TTF_STYLE_NORMAL
  outline = 0
  hinting = SDL::TTF_HINTING_NORMAL
  kerning = false
  SDL.TTF_SetFontStyle(font, renderstyle)
  SDL.TTF_SetFontOutline(font, outline)
  SDL.TTF_SetFontKerning(font, kerning)
  SDL.TTF_SetFontHinting(font, hinting)
 
  fg = SDL::Color.new
  fg[:r] = 0xFF
  fg[:g] = 0xFF
  fg[:b] = 0xFF
  fg[:a] = 0xFF

  bg = SDL::Color.new
  bg[:r] = 0x00
  bg[:g] = 0x00
  bg[:b] = 0x00
  bg[:a] = 0xFF

  text = "志於道、據於徳、依於仁、游於藝"
  surface_ptr = SDL::TTF_RenderText_Blended(font, text, text.bytesize, fg)
  abort_with_sdl_error('SDL.TTF_RenderText_Blended failed') if surface_ptr.nil? || surface_ptr.null?

  surface = SDL::Surface.new(surface_ptr)

  pos = SDL::FRect.new
  pos[:x] = ((WINDOW_W - surface[:w]) / 2.0)
  pos[:y] = ((WINDOW_H - surface[:h]) / 2.0)
  pos[:w] = surface[:w].to_f
  pos[:h] = surface[:h].to_f

  texture = SDL.CreateTextureFromSurface(renderer, surface_ptr)
  abort_with_sdl_error('SDL.CreateTextureFromSurface failed') if texture.nil? || texture.null?

  SDL.DestroySurface(surface_ptr)

  SDL.SetTextureBlendMode(texture, SDL::BLENDMODE_BLEND)

  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event)
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      # event_timestamp = event.common.timestamp
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL::EVENT_KEY_DOWN
        if event[:key][:key] == SDL::SDLK_ESCAPE
          done = true
        end
      when SDL::EVENT_WINDOW_CLOSE_REQUESTED
        done = true
      end
    end

    SDL.SetRenderDrawColor(renderer, bg[:r], bg[:g], bg[:b], bg[:a])
    SDL.RenderClear(renderer)

    SDL.RenderTexture(renderer, texture, nil, pos)

    SDL.RenderPresent(renderer)

    SDL.Delay(10)
  end

  SDL.DestroyTexture(texture)
  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.TTF_CloseFont(font)
  SDL.TTF_Quit()
  SDL.Quit()
end
