# Ruby-SDL2 : Yet another SDL2 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl2-bindings
#
# [NOTICE] This is an automatically generated file.

require 'ffi'

module SDL2
  extend FFI::Library
  # Define/Macro


  # Enum


  # Typedef

  typedef :pointer, :VkInstance
  typedef :pointer, :VkSurfaceKHR
  typedef :pointer, :SDL_vulkanInstance
  typedef :pointer, :SDL_vulkanSurface

  # Struct


  # Function

  def self.setup_vulkan_symbols()
    vulkan_symbols = [
      :SDL_Vulkan_LoadLibrary,
      :SDL_Vulkan_GetVkGetInstanceProcAddr,
      :SDL_Vulkan_UnloadLibrary,
      :SDL_Vulkan_GetInstanceExtensions,
      :SDL_Vulkan_CreateSurface,
      :SDL_Vulkan_GetDrawableSize,
    ]
    vulkan_args = {
      :SDL_Vulkan_LoadLibrary => [:pointer], 
      :SDL_Vulkan_GetVkGetInstanceProcAddr => [], 
      :SDL_Vulkan_UnloadLibrary => [], 
      :SDL_Vulkan_GetInstanceExtensions => [:pointer, :pointer, :pointer], 
      :SDL_Vulkan_CreateSurface => [:pointer, :pointer, :pointer], 
      :SDL_Vulkan_GetDrawableSize => [:pointer, :pointer, :pointer], 
    }
    vulkan_retvals = {
      :SDL_Vulkan_LoadLibrary => :int,
      :SDL_Vulkan_GetVkGetInstanceProcAddr => :pointer,
      :SDL_Vulkan_UnloadLibrary => :void,
      :SDL_Vulkan_GetInstanceExtensions => :int,
      :SDL_Vulkan_CreateSurface => :int,
      :SDL_Vulkan_GetDrawableSize => :void,
    }
    vulkan_symbols.each do |sym|
      begin
        attach_function sym, vulkan_args[sym], vulkan_retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).")
      end
    end
  end

end

