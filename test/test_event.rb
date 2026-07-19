require_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_VIDEO | SDL::INIT_EVENTS)

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
    end

    count += 1
    done = true if count >= 100
    SDL.Delay(fpsdelay)
  end

  SDL.Quit()
end
