# Tested with:
# - Xbox One S Controller on macOS 12.1 [2022-01-26]
require_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_VIDEO | SDL::INIT_GAMEPAD | SDL::INIT_JOYSTICK)

  if File.exist?('gamecontrollerdb.txt')
    # curl -O https://raw.githubusercontent.com/gabomdq/SDL_GameControllerDB/master/gamecontrollerdb.txt
    SDL.AddGamepadMapping(IO.read('gamecontrollerdb.txt'))
  end

  count_ptr = FFI::MemoryPointer.new(:int)
  joysticks = SDL.GetJoysticks(count_ptr)
  n_joysticks = count_ptr.read_int
  if n_joysticks <= 0
    $stderr.puts 'ERROR: No joysticks found'
    exit
  end
  for i in 0...n_joysticks
    joystick_id = joysticks.get_uint32(i * FFI.type_size(:uint))
    name = SDL.GetJoystickNameForID(joystick_id)
    printf("Joystick %d: %s\n", i, name ? name.read_string : "Unknown Joystick")
  end

  first_id = joysticks.get_uint32(0)
  gamepad = SDL.IsGamepad(first_id) ? SDL.OpenGamepad(first_id) : nil
  joystick = gamepad ? SDL.GetGamepadJoystick(gamepad) : SDL.OpenJoystick(first_id)
  puts("Gamepad type: #{gamepad ? SDL.GetGamepadType(gamepad) : 'N/A'}")
  printf("       axes: %d\n", SDL.GetNumJoystickAxes(joystick))
  printf("      balls: %d\n", SDL.GetNumJoystickBalls(joystick))
  printf("       hats: %d\n", SDL.GetNumJoystickHats(joystick))
  printf("    buttons: %d\n", SDL.GetNumJoystickButtons(joystick))
  printf("instance id: %d\n", SDL.GetJoystickID(joystick))

  WINDOW_W = 320
  WINDOW_H = 240
  window = SDL.CreateWindow("1st SDL Window via sdl3-bindings", 0, 0, WINDOW_W, WINDOW_H, 0)

  event = SDL::Event.new
  done = false
  while not done
    while SDL.PollEvent(event)
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"

      case event_type
      when SDL::EVENT_JOYSTICK_AXIS_MOTION, SDL::EVENT_GAMEPAD_AXIS_MOTION
        puts "axis=#{event[:jaxis][:axis]}, value=#{event[:jaxis][:value]}"

      when SDL::EVENT_KEY_DOWN
        if event[:key][:key] == SDL::SDLK_ESCAPE
          done = true
        end
      when SDL::EVENT_JOYSTICK_BUTTON_UP, SDL::EVENT_GAMEPAD_BUTTON_UP
        puts "button=#{event[:jbutton][:button]}"
      end
    end

  end

  if gamepad
    SDL.CloseGamepad(gamepad)
  elsif joystick
    SDL.CloseJoystick(joystick)
  end
  SDL.DestroyWindow(window)
  SDL.Quit()
end
