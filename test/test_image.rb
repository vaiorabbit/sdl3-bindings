require_relative '../lib/sdl3'
require_relative 'util'

WINDOW_W = 640
WINDOW_H = 360

if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL.Init(SDL::INIT_AUDIO | SDL::INIT_VIDEO | SDL::INIT_GAMEPAD)
  exit unless success

  window = SDL.CreateWindow("Minimal SDL_Image Test via sdl2-bindings", WINDOW_W, WINDOW_H, 0)

  renderer = SDL.CreateRenderer(window, nil)

  io = SDL.IOFromFile(ARGV[0], 'rb')

  puts "PNG?: #{SDL.IMG_isPNG(io)}"

  img = SDL.IMG_Load_IO(io, true)
  image = SDL::Surface.new(img)

  texture = SDL.CreateTextureFromSurface(renderer, image)
  original_w = image[:w]
  original_h = image[:h]

  rect = SDL::FRect.new
  rect[:x] = (WINDOW_W - original_w) / 2
  rect[:y] = (WINDOW_H - original_h) / 2
  rect[:w] = original_w
  rect[:h] = original_h

  SDL.RenderTexture(renderer, texture, nil, rect)

  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event)
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      # event_timestamp = event.common.timestamp
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event[:common][:type]
      when SDL::EVENT_KEY_DOWN
        if event[:key][:key] == SDL::SDLK_ESCAPE
          done = true
        end
      end
    end

    SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
    SDL.RenderClear(renderer)
    SDL.RenderTexture(renderer, texture, nil, rect)
    SDL.RenderPresent(renderer)

    SDL.Delay(10)
  end

  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
