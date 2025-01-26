# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings

require 'ffi'
require_relative 'sdl3_assert.rb'
require_relative 'sdl3_asyncio.rb'
require_relative 'sdl3_atomic.rb'
require_relative 'sdl3_audio.rb'
require_relative 'sdl3_bits.rb'
require_relative 'sdl3_blendmode.rb'
require_relative 'sdl3_camera.rb'
require_relative 'sdl3_clipboard.rb'
require_relative 'sdl3_cpuinfo.rb'
require_relative 'sdl3_dialog.rb'
require_relative 'sdl3_endian.rb'
require_relative 'sdl3_error.rb'
require_relative 'sdl3_events.rb'
require_relative 'sdl3_filesystem.rb'
require_relative 'sdl3_gamepad.rb'
require_relative 'sdl3_gpu.rb'
require_relative 'sdl3_guid.rb'
require_relative 'sdl3_haptic.rb'
require_relative 'sdl3_hints.rb'
require_relative 'sdl3_init.rb'
require_relative 'sdl3_iostream.rb'
require_relative 'sdl3_joystick.rb'
require_relative 'sdl3_keyboard.rb'
require_relative 'sdl3_keycode.rb'
require_relative 'sdl3_loadso.rb'
require_relative 'sdl3_log.rb'
require_relative 'sdl3_messagebox.rb'
require_relative 'sdl3_misc.rb'
require_relative 'sdl3_mouse.rb'
require_relative 'sdl3_mutex.rb'
require_relative 'sdl3_pen.rb'
require_relative 'sdl3_pixels.rb'
require_relative 'sdl3_platform.rb'
require_relative 'sdl3_power.rb'
require_relative 'sdl3_process.rb'
require_relative 'sdl3_properties.rb'
require_relative 'sdl3_rect.rb'
require_relative 'sdl3_render.rb'
require_relative 'sdl3_revision.rb'
require_relative 'sdl3_scancode.rb'
require_relative 'sdl3_sensor.rb'
require_relative 'sdl3_stdinc.rb'
require_relative 'sdl3_storage.rb'
require_relative 'sdl3_surface.rb'
require_relative 'sdl3_thread.rb'
require_relative 'sdl3_time.rb'
require_relative 'sdl3_timer.rb'
require_relative 'sdl3_touch.rb'
require_relative 'sdl3_tray.rb'
require_relative 'sdl3_version.rb'
require_relative 'sdl3_video.rb'
require_relative 'sdl3_vulkan.rb'

# SDL_image
require_relative 'sdl3_image.rb'
# SDL_mixer
require_relative 'sdl3_mixer.rb'
# SDL_ttf
require_relative 'sdl3_ttf.rb'
# SDL_sound
require_relative 'sdl3_sound.rb'

module SDL
  extend FFI::Library

  @@sdl3_import_done = false
  def self.load_lib(libpath, output_error: false, image_libpath: nil, ttf_libpath: nil, mixer_libpath: nil, sound_libpath: nil)

    unless @@sdl3_import_done
      # Ref.: Using Multiple and Alternate Libraries
      # https://github.com/ffi/ffi/wiki/Using-Multiple-and-Alternate-Libraries
      begin
        lib_paths = [libpath, image_libpath, ttf_libpath, mixer_libpath, sound_libpath].compact

        ffi_lib_flags :now, :global
        ffi_lib *lib_paths
        setup_symbols(output_error)

        setup_image_symbols(output_error) if image_libpath
        setup_ttf_symbols(output_error) if ttf_libpath
        setup_mixer_symbols(output_error) if mixer_libpath
        setup_sound_symbols(output_error) if sound_libpath
      rescue => error
        $stderr.puts("[Warning] Failed to load libraries (#{error}).") if output_error
      end
    end

  end

  def self.setup_symbols(output_error = false)
    setup_assert_symbols(output_error)
    setup_asyncio_symbols(output_error)
    setup_atomic_symbols(output_error)
    setup_audio_symbols(output_error)
    setup_bits_symbols(output_error)
    setup_blendmode_symbols(output_error)
    setup_camera_symbols(output_error)
    setup_clipboard_symbols(output_error)
    setup_cpuinfo_symbols(output_error)
    setup_dialog_symbols(output_error)
    setup_endian_symbols(output_error)
    setup_error_symbols(output_error)
    setup_events_symbols(output_error)
    setup_filesystem_symbols(output_error)
    setup_gamepad_symbols(output_error)
    setup_gpu_symbols(output_error)
    setup_guid_symbols(output_error)
    setup_haptic_symbols(output_error)
    setup_hints_symbols(output_error)
    setup_init_symbols(output_error)
    setup_iostream_symbols(output_error)
    setup_joystick_symbols(output_error)
    setup_keyboard_symbols(output_error)
    setup_keycode_symbols(output_error)
    setup_loadso_symbols(output_error)
    setup_log_symbols(output_error)
    setup_messagebox_symbols(output_error)
    setup_misc_symbols(output_error)
    setup_mouse_symbols(output_error)
    setup_mutex_symbols(output_error)
    setup_pen_symbols(output_error)
    setup_pixels_symbols(output_error)
    setup_platform_symbols(output_error)
    setup_power_symbols(output_error)
    setup_process_symbols(output_error)
    setup_properties_symbols(output_error)
    setup_rect_symbols(output_error)
    setup_render_symbols(output_error)
    setup_revision_symbols(output_error)
    setup_scancode_symbols(output_error)
    setup_sensor_symbols(output_error)
    setup_stdinc_symbols(output_error)
    setup_storage_symbols(output_error)
    setup_surface_symbols(output_error)
    setup_thread_symbols(output_error)
    setup_time_symbols(output_error)
    setup_timer_symbols(output_error)
    setup_touch_symbols(output_error)
    setup_tray_symbols(output_error)
    setup_version_symbols(output_error)
    setup_video_symbols(output_error)
    setup_vulkan_symbols(output_error)
  end

end
