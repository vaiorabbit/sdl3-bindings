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

  CAMERA_POSITION_UNKNOWN = 0
  CAMERA_POSITION_FRONT_FACING = 1
  CAMERA_POSITION_BACK_FACING = 2

  # Typedef

  typedef :uint, :SDL_CameraID
  typedef :int, :SDL_CameraPosition

  # Struct

  class CameraSpec < FFI::Struct
    layout(
      :format, :int,
      :colorspace, :int,
      :width, :int,
      :height, :int,
      :framerate_numerator, :int,
      :framerate_denominator, :int,
    )
  end


  # Function

  def self.setup_camera_symbols(output_error = false)
    entries = [
      [:GetNumCameraDrivers, :SDL_GetNumCameraDrivers, [], :int],
      [:GetCameraDriver, :SDL_GetCameraDriver, [:int], :pointer],
      [:GetCurrentCameraDriver, :SDL_GetCurrentCameraDriver, [], :pointer],
      [:GetCameras, :SDL_GetCameras, [:pointer], :pointer],
      [:GetCameraSupportedFormats, :SDL_GetCameraSupportedFormats, [:uint, :pointer], :pointer],
      [:GetCameraName, :SDL_GetCameraName, [:uint], :pointer],
      [:GetCameraPosition, :SDL_GetCameraPosition, [:uint], :int],
      [:OpenCamera, :SDL_OpenCamera, [:uint, :pointer], :pointer],
      [:GetCameraPermissionState, :SDL_GetCameraPermissionState, [:pointer], :int],
      [:GetCameraID, :SDL_GetCameraID, [:pointer], :uint],
      [:GetCameraProperties, :SDL_GetCameraProperties, [:pointer], :uint],
      [:GetCameraFormat, :SDL_GetCameraFormat, [:pointer, :pointer], :bool],
      [:AcquireCameraFrame, :SDL_AcquireCameraFrame, [:pointer, :pointer], :pointer],
      [:ReleaseCameraFrame, :SDL_ReleaseCameraFrame, [:pointer, :pointer], :void],
      [:CloseCamera, :SDL_CloseCamera, [:pointer], :void],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

