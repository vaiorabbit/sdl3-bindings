require_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_VIDEO | SDL::INIT_EVENTS)

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL.CreateWindow("1st SDL Window via sdl3-bindings", WINDOW_W, WINDOW_H, 0)

  props = SDL.GetWindowProperties(window)
  host_os = RbConfig::CONFIG['host_os']
  if host_os =~ /mswin|msys|mingw|cygwin/
    hwnd = SDL.GetPointerProperty(props, SDL::PROP_WINDOW_WIN32_HWND_POINTER, nil)
    pp [:win32, hwnd]
  elsif host_os =~ /darwin/
    cocoa = SDL.GetPointerProperty(props, SDL::PROP_WINDOW_COCOA_WINDOW_POINTER, nil)
    pp [:cocoa, cocoa]
  elsif host_os =~ /linux/
    driver = SDL.GetCurrentVideoDriver()
    driver_str = driver ? driver.read_string : "unknown"
    if driver_str == 'wayland'
      wl = SDL.GetPointerProperty(props, SDL::PROP_WINDOW_WAYLAND_SURFACE_POINTER, nil)
      pp [:wayland, wl]
    else
      x11 = SDL.GetNumberProperty(props, SDL::PROP_WINDOW_X11_WINDOW_NUMBER, 0)
      pp [:x11, x11]
    end
  else
    puts "Unknown host OS: #{host_os}"
  end

  fpsdelay = 100;

  count = 0
  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event)
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"

      case event_type
      when SDL::EVENT_KEY_DOWN
        if event[:key][:key] == SDL::SDLK_SPACE
          puts "\tSPACE key pressed."
        elsif event[:key][:key] == SDL::SDLK_ESCAPE
          done = true
        end
      when SDL::EVENT_WINDOW_CLOSE_REQUESTED
        done = true
      end
    end

    count += 1
    done = true if count >= 100
    SDL.Delay(fpsdelay)
  end

  SDL.DestroyWindow(window)
  SDL.Quit()
end
