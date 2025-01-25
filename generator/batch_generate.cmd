@echo off
set PYTHONPATH=.\clang
python generate_SDL_assert.py > ../lib/sdl3_assert.rb
python generate_SDL_asyncio.py > ../lib/sdl3_asyncio.rb
python generate_SDL_atomic.py > ../lib/sdl3_atomic.rb
python generate_SDL_audio.py > ../lib/sdl3_audio.rb
python generate_SDL_bits.py > ../lib/sdl3_bits.rb
python generate_SDL_blendmode.py > ../lib/sdl3_blendmode.rb
python generate_SDL_camera.py > ../lib/sdl3_camera.rb
python generate_SDL_clipboard.py > ../lib/sdl3_clipboard.rb
python generate_SDL_cpuinfo.py > ../lib/sdl3_cpuinfo.rb
python generate_SDL_dialog.py > ../lib/sdl3_dialog.rb
python generate_SDL_endian.py > ../lib/sdl3_endian.rb
python generate_SDL_error.py > ../lib/sdl3_error.rb
python generate_SDL_events.py > ../lib/sdl3_events.rb
python generate_SDL_filesystem.py > ../lib/sdl3_filesystem.rb
python generate_SDL_gamepad.py > ../lib/sdl3_gamepad.rb
python generate_SDL_gpu.py > ../lib/sdl3_gpu.rb
python generate_SDL_guid.py > ../lib/sdl3_guid.rb
python generate_SDL_haptic.py > ../lib/sdl3_haptic.rb
python generate_SDL_hidapi.py > ../lib/sdl3_hidapi.rb
python generate_SDL_hints.py > ../lib/sdl3_hints.rb
python generate_SDL_init.py > ../lib/sdl3_init.rb
python generate_SDL_iostream.py > ../lib/sdl3_iostream.rb
python generate_SDL_joystick.py > ../lib/sdl3_joystick.rb
python generate_SDL_keyboard.py > ../lib/sdl3_keyboard.rb
python generate_SDL_keycode.py > ../lib/sdl3_keycode.rb
python generate_SDL_loadso.py > ../lib/sdl3_loadso.rb
python generate_SDL_locale.py > ../lib/sdl3_locale.rb
python generate_SDL_log.py > ../lib/sdl3_log.rb
python generate_SDL_messagebox.py > ../lib/sdl3_messagebox.rb
python generate_SDL_misc.py > ../lib/sdl3_misc.rb
python generate_SDL_mouse.py > ../lib/sdl3_mouse.rb
python generate_SDL_mutex.py > ../lib/sdl3_mutex.rb
python generate_SDL_pen.py > ../lib/sdl3_pen.rb
python generate_SDL_pixels.py > ../lib/sdl3_pixels.rb
python generate_SDL_platform.py > ../lib/sdl3_platform.rb
python generate_SDL_power.py > ../lib/sdl3_power.rb
python generate_SDL_process.py > ../lib/sdl3_process.rb
python generate_SDL_properties.py > ../lib/sdl3_properties.rb
python generate_SDL_rect.py > ../lib/sdl3_rect.rb
python generate_SDL_render.py > ../lib/sdl3_render.rb
python generate_SDL_revision.py > ../lib/sdl3_revision.rb
:: python generate_SDL_scancode.py > ../lib/sdl3_scancode.rb
:: python generate_SDL_sensor.py > ../lib/sdl3_sensor.rb
:: python generate_SDL_stdinc.py > ../lib/sdl3_stdinc.rb
:: python generate_SDL_storage.py > ../lib/sdl3_storage.rb
:: python generate_SDL_surface.py > ../lib/sdl3_surface.rb
:: python generate_SDL_system.py > ../lib/sdl3_system.rb
:: python generate_SDL_thread.py > ../lib/sdl3_thread.rb
:: python generate_SDL_time.py > ../lib/sdl3_time.rb
:: python generate_SDL_timer.py > ../lib/sdl3_timer.rb
:: python generate_SDL_touch.py > ../lib/sdl3_touch.rb
:: python generate_SDL_tray.py > ../lib/sdl3_tray.rb
:: python generate_SDL_version.py > ../lib/sdl3_version.rb
:: python generate_SDL_video.py > ../lib/sdl3_video.rb
:: python generate_SDL_vulkan.py > ../lib/sdl3_vulkan.rb
:: 
:: python generate_SDL_ttf.py > ../lib/sdl3_ttf.rb
:: python generate_SDL_image.py > ../lib/sdl3_image.rb
:: python generate_SDL_mixer.py > ../lib/sdl3_mixer.rb
