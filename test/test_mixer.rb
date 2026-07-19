nrequire_relative '../lib/sdl3'
require_relative 'util'

if __FILE__ == $0
  if ARGV[0] == nil
    $stderr.puts 'Usage: ruby test_mixer.rb [path to .wav]'
    exit
  end

  load_sdl3_lib()
  exit unless SDL.Init(SDL::INIT_AUDIO)
  exit unless SDL.MIX_Init()

  mixer = SDL.MIX_CreateMixerDevice(SDL::AUDIO_DEVICE_DEFAULT_PLAYBACK, nil)
  exit if mixer.nil? || mixer.null?

  audio = SDL.MIX_LoadAudio_IO(mixer, SDL.IOFromFile(ARGV[0], 'rb'), true, true)
  exit if audio.nil? || audio.null?

  track = SDL.MIX_CreateTrack(mixer)
  exit if track.nil? || track.null?

  SDL.MIX_SetTrackAudio(track, audio)
  options = SDL.CreateProperties()
  SDL.SetNumberProperty(options, SDL::MIX_PROP_PLAY_LOOPS_NUMBER, 0)
  SDL.MIX_PlayTrack(track, options)

  while SDL.MIX_TrackPlaying(track)
    SDL.Delay(50)
  end

  SDL.MIX_DestroyTrack(track)
  SDL.MIX_DestroyAudio(audio)
  SDL.MIX_DestroyMixer(mixer)
  SDL.MIX_Quit()
  SDL.Quit()
end
