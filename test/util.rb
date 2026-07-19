def load_sdl3_lib()
  case RbConfig::CONFIG['host_os']
  when /mswin|msys|mingw|cygwin/
    SDL.load_lib(File.absolute_path(Dir.pwd + '/../third_party/SDL/bin/SDL3.dll'),
                 image_libpath: File.absolute_path(Dir.pwd + '/../third_party/SDL/bin/SDL3_image.dll'),
                 mixer_libpath: File.absolute_path(Dir.pwd + '/../third_party/SDL/bin/SDL3_mixer.dll'),
                 ttf_libpath: File.absolute_path(Dir.pwd + '/../third_party/SDL/bin/SDL3_ttf.dll'),
                 sound_libpath: File.absolute_path(Dir.pwd + '/../third_party/SDL/bin/SDL3_sound.dll'),
                 shadercross_libpath: File.absolute_path(Dir.pwd + '/../third_party/SDL/bin/SDL3_shadercross.dll'))
  when /darwin/
    SDL.load_lib('../third_party/SDL/lib/libSDL3.dylib', output_error: true,
                 image_libpath: '../third_party/SDL/lib/libSDL3_image.dylib',
                 mixer_libpath: '../third_party/SDL/lib/libSDL3_mixer.dylib',
                 ttf_libpath: '../third_party/SDL/lib/libSDL3_ttf.dylib',
                 sound_libpath: '../third_party/SDL/lib/libSDL3_sound.dylib',
                 shadercross_libpath: '../third_party/SDL/lib/libSDL3_shadercross.dylib')
  when /linux/
    # Tested on Ubuntu Linux
    SDL.load_lib("/lib/#{RUBY_PLATFORM}-gnu/libSDL3.so")
  else
    raise RuntimeError, "Unsupported platform."
  end
end
