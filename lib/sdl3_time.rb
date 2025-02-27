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

  DATE_FORMAT_YYYYMMDD = 0
  DATE_FORMAT_DDMMYYYY = 1
  DATE_FORMAT_MMDDYYYY = 2
  TIME_FORMAT_24HR = 0
  TIME_FORMAT_12HR = 1

  # Typedef

  typedef :int, :SDL_DateFormat
  typedef :int, :SDL_TimeFormat

  # Struct

  class DateTime < FFI::Struct
    layout(
      :year, :int,
      :month, :int,
      :day, :int,
      :hour, :int,
      :minute, :int,
      :second, :int,
      :nanosecond, :int,
      :day_of_week, :int,
      :utc_offset, :int,
    )
  end


  # Function

  def self.setup_time_symbols(output_error = false)
    entries = [
      [:GetDateTimeLocalePreferences, :SDL_GetDateTimeLocalePreferences, [:pointer, :pointer], :bool],
      [:GetCurrentTime, :SDL_GetCurrentTime, [:pointer], :bool],
      [:TimeToDateTime, :SDL_TimeToDateTime, [:long_long, :pointer, :bool], :bool],
      [:DateTimeToTime, :SDL_DateTimeToTime, [:pointer, :pointer], :bool],
      [:TimeToWindows, :SDL_TimeToWindows, [:long_long, :pointer, :pointer], :void],
      [:TimeFromWindows, :SDL_TimeFromWindows, [:uint, :uint], :long_long],
      [:GetDaysInMonth, :SDL_GetDaysInMonth, [:int, :int], :int],
      [:GetDayOfYear, :SDL_GetDayOfYear, [:int, :int, :int], :int],
      [:GetDayOfWeek, :SDL_GetDayOfWeek, [:int, :int, :int], :int],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

