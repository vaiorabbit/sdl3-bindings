require_relative '../lib/sdl3'
require_relative 'util'

class Texture
  attr_accessor :sprite, :w, :h
  def initialize
    @sprite = nil
    @w = 0
    @h = 0
  end
end
$texture = nil

class Sprite
  attr_accessor :pos, :vel
  def initialize
    @pos = SDL::FRect.new
    @vel = SDL::FRect.new
  end
end
$sprites = nil

WINDOW_W = 640
WINDOW_H = 360
NUM_SPRITES = 100

def load_sprite(file, renderer)
  surface = SDL::Surface.new(SDL.LoadBMP(file))
  $texture = Texture.new
  $texture.w = surface[:w]
  $texture.h = surface[:h]

  SDL.SetSurfaceColorKey(surface, true, surface[:pixels].read(:uint8))

  $texture.sprite = SDL.CreateTextureFromSurface(renderer, surface)
  SDL.DestroySurface(surface)
end

def move_sprite(renderer)
  viewport = SDL::Rect.new
  SDL.GetRenderViewport(renderer, viewport)
  vw, vh = viewport[:w], viewport[:h]

  SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL.RenderClear(renderer)

  NUM_SPRITES.times do |i|
    $sprites[i].pos[:x] += $sprites[i].vel[:x]
    if $sprites[i].pos[:x] < 0 || $sprites[i].pos[:x] > (vw - $texture.w)
      $sprites[i].vel[:x] = -$sprites[i].vel[:x]
    end
    $sprites[i].pos[:y] += $sprites[i].vel[:y]
    if $sprites[i].pos[:y] < 0 || $sprites[i].pos[:y] > (vh - $texture.w)
      $sprites[i].vel[:y] = -$sprites[i].vel[:y]
    end

    SDL.RenderTexture(renderer, $texture.sprite, nil, $sprites[i].pos)
  end
  SDL.RenderPresent(renderer)
end

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()

  window = SDL.CreateWindow("Minimal Sprite Test via sdl3-bindings", WINDOW_W, WINDOW_H, SDL::WINDOW_RESIZABLE)
  SDL.SetWindowPosition(window, 64, 64)

  SDL.SetHint(SDL::HINT_RENDER_VSYNC, "1")
  renderer = SDL.CreateRenderer(window, nil)
  pp SDL.GetRendererName(renderer).read_string if renderer != nil


  SDL.SetRenderLogicalPresentation(renderer, WINDOW_W, WINDOW_H, SDL::LOGICAL_PRESENTATION_LETTERBOX)

  load_sprite("Globe.bmp", renderer)

  $sprites = Array.new(NUM_SPRITES) { Sprite.new }
  NUM_SPRITES.times do |i|
    $sprites[i].pos[:x] = (rand() % (WINDOW_W - $texture.w)).to_f
    $sprites[i].pos[:y] = (rand() % (WINDOW_H - $texture.h)).to_f
    $sprites[i].pos[:w] = $texture.w.to_f
    $sprites[i].pos[:h] = $texture.h.to_f
    $sprites[i].vel[:x] = 20*rand() - 10
    $sprites[i].vel[:y] = 20*rand() - 10
  end

  event = SDL::Event.new
  done = false
  until done
    while SDL.PollEvent(event)
      event_type = event[:common][:type]
      case event_type
      when SDL::EVENT_KEY_DOWN
        done = true if event[:key][:key] == SDL::SDLK_ESCAPE
      when SDL::EVENT_WINDOW_CLOSE_REQUESTED
        done = true
      end
    end
    move_sprite(renderer)
  end

  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
