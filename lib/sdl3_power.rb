# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro


  # Enum

  POWERSTATE_ERROR = -1
  POWERSTATE_UNKNOWN = 0
  POWERSTATE_ON_BATTERY = 1
  POWERSTATE_NO_BATTERY = 2
  POWERSTATE_CHARGING = 3
  POWERSTATE_CHARGED = 4

  # Typedef

  typedef :int, :SDL_PowerState

  # Struct


  # Function

  def self.setup_power_symbols(output_error = false)
    entries = [
      [:GetPowerInfo, :SDL_GetPowerInfo, [:pointer, :pointer], :int],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

