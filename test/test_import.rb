require_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  success = SDL.Init(SDL::INIT_VIDEO | SDL::INIT_AUDIO | SDL::INIT_EVENTS | SDL::INIT_GAMEPAD | SDL::INIT_JOYSTICK)
  puts "SDL_Init : #{success ? 'Success' : 'Failed'}"
  exit unless success
  puts "Platform: #{SDL.GetPlatform().read_string}"
  version = SDL.GetVersion()
  major = version / 1_000_000
  minor = (version / 1_000) % 1_000
  micro = version % 1_000
  puts("Major, Minor and Patch: #{major} #{minor} #{micro}")
  SDL.ResetHints()
  SDL.Quit()
end
