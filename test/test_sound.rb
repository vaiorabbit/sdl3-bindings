require_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $0
  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_AUDIO)

  success = SDL.Sound_Init()
  exit if success < 0

  puts("SDL_sound version: #{SDL.Sound_Version}")

  decoder_info_ptr = SDL.Sound_AvailableDecoders()
  until decoder_info_ptr.read_pointer.null?
    decoder_info = SDL::Sound_DecoderInfo.new(decoder_info_ptr.read_pointer)
    extensions = []
    extensions_ptr = decoder_info[:extensions]
    until extensions_ptr.read_pointer.null?
      extensions << extensions_ptr.read_pointer.read_string
      extensions_ptr = extensions_ptr + FFI::NativeType::POINTER.size
    end
    puts "Decoder for: #{extensions.join(', ')}"
    puts "\tDescription: #{decoder_info[:description].read_string}"
    puts "\tAuthor: #{decoder_info[:author].read_string}"
    puts "\tURL: #{decoder_info[:url].read_string}"
    decoder_info_ptr = decoder_info_ptr + FFI::NativeType::POINTER.size
  end

  SDL.Sound_Quit()
  SDL.Quit()
end
