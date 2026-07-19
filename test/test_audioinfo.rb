# sdl3-bindings port of testaudioinfo.c
require_relative '../lib/sdl3'
require_relative 'util'

def print_devices(playback)
  typestr = playback ? "playback" : "recording"
  count_buf = FFI::MemoryPointer.new(:int)
  device_ids = playback ? SDL.GetAudioPlaybackDevices(count_buf) : SDL.GetAudioRecordingDevices(count_buf)
  n = count_buf.read_int

  puts("#{typestr} devices:")

  if device_ids.nil? || device_ids.null?
    printf("  Driver can't detect specific %s devices.\n\n", typestr)
  elsif n == 0
    printf("  No %s devices found.\n\n", typestr)
  else
    n.times do |i|
      device_id = device_ids.get_uint32(i * FFI.type_size(:uint))
      name = SDL.GetAudioDeviceName(device_id)
      printf("  [%u] %s\n", device_id, name ? name.read_string : "Unknown")
    end
    printf("\n")
  end
end

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_AUDIO)
  n = SDL.GetNumAudioDrivers()
  if n == 0
    printf("No built-in audio drivers\n\n")
  else
    print("Built-in audio drivers:\n")
    n.times do |i|
      printf("  %s\n", SDL.GetAudioDriver(i).read_string)
    end
  end

  printf("Using audio driver: %s\n\n", SDL.GetCurrentAudioDriver().read_string)

  print_devices(true)
  print_devices(false)

  SDL.Quit()
end

=begin

  # Original Copyright Notice:

  Copyright (C) 1997-2014 Sam Lantinga <slouken@libsdl.org>

  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.

  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely.
=end
