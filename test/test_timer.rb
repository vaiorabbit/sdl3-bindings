require_relative '../lib/sdl3'
require_relative 'util'

$ticks = 0

if __FILE__ == $PROGRAM_NAME
  load_sdl3_lib()
  exit unless SDL.Init(0)

  resolution = 1

  cb = Proc.new do |param, timer_id, interval|
    puts("Timer id=#{timer_id} interval=#{interval} : param=#{param}, $ticks=#{$ticks}")
    $ticks += 1
    interval
  end

  thr = Thread.new(1) do |i|
    t1 = SDL.AddTimer(resolution, cb, nil)

    print("Waiting Timer...")
    sleep(1)
    puts("Done.")
    SDL.RemoveTimer(t1)
  end

  puts("Waiting thread...")
  thr.join

  if $ticks > 0
    printf("Timer resolution: desired = %d ms, actual = %f ms\n", resolution, (10 * 1000).to_f / $ticks);
  end

  SDL.Quit()
end
