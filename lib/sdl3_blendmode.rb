# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  BLENDMODE_NONE = 0x00000000
  BLENDMODE_BLEND = 0x00000001
  BLENDMODE_BLEND_PREMULTIPLIED = 0x00000010
  BLENDMODE_ADD = 0x00000002
  BLENDMODE_ADD_PREMULTIPLIED = 0x00000020
  BLENDMODE_MOD = 0x00000004
  BLENDMODE_MUL = 0x00000008
  BLENDMODE_INVALID = 0x7FFFFFFF

  # Enum

  BLENDOPERATION_ADD = 1
  BLENDOPERATION_SUBTRACT = 2
  BLENDOPERATION_REV_SUBTRACT = 3
  BLENDOPERATION_MINIMUM = 4
  BLENDOPERATION_MAXIMUM = 5
  BLENDFACTOR_ZERO = 1
  BLENDFACTOR_ONE = 2
  BLENDFACTOR_SRC_COLOR = 3
  BLENDFACTOR_ONE_MINUS_SRC_COLOR = 4
  BLENDFACTOR_SRC_ALPHA = 5
  BLENDFACTOR_ONE_MINUS_SRC_ALPHA = 6
  BLENDFACTOR_DST_COLOR = 7
  BLENDFACTOR_ONE_MINUS_DST_COLOR = 8
  BLENDFACTOR_DST_ALPHA = 9
  BLENDFACTOR_ONE_MINUS_DST_ALPHA = 10

  # Typedef

  typedef :uint, :SDL_BlendMode
  typedef :int, :SDL_BlendOperation
  typedef :int, :SDL_BlendFactor

  # Struct


  # Function

  def self.setup_blendmode_symbols(output_error = false)
    entries = [
      [:ComposeCustomBlendMode, :SDL_ComposeCustomBlendMode, [:int, :int, :int, :int, :int, :int], :uint],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

