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

  PROPERTY_TYPE_INVALID = 0
  PROPERTY_TYPE_POINTER = 1
  PROPERTY_TYPE_STRING = 2
  PROPERTY_TYPE_NUMBER = 3
  PROPERTY_TYPE_FLOAT = 4
  PROPERTY_TYPE_BOOLEAN = 5

  # Typedef

  typedef :uint, :SDL_PropertiesID
  typedef :int, :SDL_PropertyType
  callback :SDL_CleanupPropertyCallback, [:pointer, :pointer], :void
  callback :SDL_EnumeratePropertiesCallback, [:pointer, :uint, :pointer], :void

  # Struct


  # Function

  def self.setup_properties_symbols(output_error = false)
    entries = [
      [:GetGlobalProperties, :SDL_GetGlobalProperties, [], :uint],
      [:CreateProperties, :SDL_CreateProperties, [], :uint],
      [:CopyProperties, :SDL_CopyProperties, [:uint, :uint], :bool],
      [:LockProperties, :SDL_LockProperties, [:uint], :bool],
      [:UnlockProperties, :SDL_UnlockProperties, [:uint], :void],
      [:SetPointerPropertyWithCleanup, :SDL_SetPointerPropertyWithCleanup, [:uint, :pointer, :pointer, :SDL_CleanupPropertyCallback, :pointer], :bool],
      [:SetPointerProperty, :SDL_SetPointerProperty, [:uint, :pointer, :pointer], :bool],
      [:SetStringProperty, :SDL_SetStringProperty, [:uint, :pointer, :pointer], :bool],
      [:SetNumberProperty, :SDL_SetNumberProperty, [:uint, :pointer, :long_long], :bool],
      [:SetFloatProperty, :SDL_SetFloatProperty, [:uint, :pointer, :float], :bool],
      [:SetBooleanProperty, :SDL_SetBooleanProperty, [:uint, :pointer, :bool], :bool],
      [:HasProperty, :SDL_HasProperty, [:uint, :pointer], :bool],
      [:GetPropertyType, :SDL_GetPropertyType, [:uint, :pointer], :int],
      [:GetPointerProperty, :SDL_GetPointerProperty, [:uint, :pointer, :pointer], :pointer],
      [:GetStringProperty, :SDL_GetStringProperty, [:uint, :pointer, :pointer], :pointer],
      [:GetNumberProperty, :SDL_GetNumberProperty, [:uint, :pointer, :long_long], :long_long],
      [:GetFloatProperty, :SDL_GetFloatProperty, [:uint, :pointer, :float], :float],
      [:GetBooleanProperty, :SDL_GetBooleanProperty, [:uint, :pointer, :bool], :bool],
      [:ClearProperty, :SDL_ClearProperty, [:uint, :pointer], :bool],
      [:EnumerateProperties, :SDL_EnumerateProperties, [:uint, :SDL_EnumeratePropertiesCallback, :pointer], :bool],
      [:DestroyProperties, :SDL_DestroyProperties, [:uint], :void],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

