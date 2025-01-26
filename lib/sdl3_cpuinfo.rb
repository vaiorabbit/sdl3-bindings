# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  CACHELINE_SIZE = 128

  # Enum


  # Typedef


  # Struct


  # Function

  def self.setup_cpuinfo_symbols(output_error = false)
    entries = [
      [:GetNumLogicalCPUCores, :SDL_GetNumLogicalCPUCores, [], :int],
      [:GetCPUCacheLineSize, :SDL_GetCPUCacheLineSize, [], :int],
      [:HasAltiVec, :SDL_HasAltiVec, [], :bool],
      [:HasMMX, :SDL_HasMMX, [], :bool],
      [:HasSSE, :SDL_HasSSE, [], :bool],
      [:HasSSE2, :SDL_HasSSE2, [], :bool],
      [:HasSSE3, :SDL_HasSSE3, [], :bool],
      [:HasSSE41, :SDL_HasSSE41, [], :bool],
      [:HasSSE42, :SDL_HasSSE42, [], :bool],
      [:HasAVX, :SDL_HasAVX, [], :bool],
      [:HasAVX2, :SDL_HasAVX2, [], :bool],
      [:HasAVX512F, :SDL_HasAVX512F, [], :bool],
      [:HasARMSIMD, :SDL_HasARMSIMD, [], :bool],
      [:HasNEON, :SDL_HasNEON, [], :bool],
      [:HasLSX, :SDL_HasLSX, [], :bool],
      [:HasLASX, :SDL_HasLASX, [], :bool],
      [:GetSystemRAM, :SDL_GetSystemRAM, [], :int],
      [:GetSIMDAlignment, :SDL_GetSIMDAlignment, [], :ulong_long],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

