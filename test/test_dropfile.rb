# TODO : Prepare Info.plist to support D&D on Mac OS X.
require_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_VIDEO)

  WINDOW_W = 640
  WINDOW_H = 360
  window = SDL.CreateWindow("Drop File Test (sdl3-bindings)", WINDOW_W, WINDOW_H, SDL::WINDOW_OPENGL)

  renderer = SDL.CreateRenderer(window, nil)
  SDL.SetRenderDrawColor(renderer, 0xA0, 0xA0, 0xA0, 0xFF)
  SDL.RenderClear(renderer)
  SDL.RenderPresent(renderer)

  event = SDL::Event.new

  SDL.SetEventEnabled(SDL::EVENT_DROP_FILE, true)
  p SDL.EventEnabled(SDL::EVENT_DROP_FILE)

  done = false
  while not done
    while SDL.PollEvent(event)
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL::EVENT_KEY_DOWN
        if event[:key][:key] == SDL::SDLK_ESCAPE
          done = true
        end
      when SDL::EVENT_DROP_FILE
        printf("File dropped on window: %s\n", event[:drop][:data].read_string)
      end
    end

    # SDL.Delay(10)
  end

  SDL.DestroyRenderer(renderer)
  SDL.DestroyWindow(window)
  SDL.Quit()
end
