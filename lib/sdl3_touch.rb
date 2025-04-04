# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  TOUCH_MOUSEID = -1
  MOUSE_TOUCHID = -1

  # Enum

  TOUCH_DEVICE_INVALID = -1
  TOUCH_DEVICE_DIRECT = 0
  TOUCH_DEVICE_INDIRECT_ABSOLUTE = 1
  TOUCH_DEVICE_INDIRECT_RELATIVE = 2

  # Typedef

  typedef :ulong_long, :SDL_TouchID
  typedef :ulong_long, :SDL_FingerID
  typedef :int, :SDL_TouchDeviceType

  # Struct

  class Finger < FFI::Struct
    layout(
      :id, :ulong_long,
      :x, :float,
      :y, :float,
      :pressure, :float,
    )
  end


  # Function

  def self.setup_touch_symbols(output_error = false)
    entries = [
      [:GetTouchDevices, :SDL_GetTouchDevices, [:pointer], :pointer],
      [:GetTouchDeviceName, :SDL_GetTouchDeviceName, [:ulong_long], :pointer],
      [:GetTouchDeviceType, :SDL_GetTouchDeviceType, [:ulong_long], :int],
      [:GetTouchFingers, :SDL_GetTouchFingers, [:ulong_long, :pointer], :pointer],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

