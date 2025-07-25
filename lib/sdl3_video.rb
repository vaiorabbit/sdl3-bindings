# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  PROP_GLOBAL_VIDEO_WAYLAND_WL_DISPLAY_POINTER = "SDL.video.wayland.wl_display"
  WINDOW_FULLSCREEN = 0x0000000000000001
  WINDOW_OPENGL = 0x0000000000000002
  WINDOW_OCCLUDED = 0x0000000000000004
  WINDOW_HIDDEN = 0x0000000000000008
  WINDOW_BORDERLESS = 0x0000000000000010
  WINDOW_RESIZABLE = 0x0000000000000020
  WINDOW_MINIMIZED = 0x0000000000000040
  WINDOW_MAXIMIZED = 0x0000000000000080
  WINDOW_MOUSE_GRABBED = 0x0000000000000100
  WINDOW_INPUT_FOCUS = 0x0000000000000200
  WINDOW_MOUSE_FOCUS = 0x0000000000000400
  WINDOW_EXTERNAL = 0x0000000000000800
  WINDOW_MODAL = 0x0000000000001000
  WINDOW_HIGH_PIXEL_DENSITY = 0x0000000000002000
  WINDOW_MOUSE_CAPTURE = 0x0000000000004000
  WINDOW_MOUSE_RELATIVE_MODE = 0x0000000000008000
  WINDOW_ALWAYS_ON_TOP = 0x0000000000010000
  WINDOW_UTILITY = 0x0000000000020000
  WINDOW_TOOLTIP = 0x0000000000040000
  WINDOW_POPUP_MENU = 0x0000000000080000
  WINDOW_KEYBOARD_GRABBED = 0x0000000000100000
  WINDOW_VULKAN = 0x0000000010000000
  WINDOW_METAL = 0x0000000020000000
  WINDOW_TRANSPARENT = 0x0000000040000000
  WINDOW_NOT_FOCUSABLE = 0x0000000080000000
  WINDOWPOS_UNDEFINED_MASK = 0x1FFF0000
  WINDOWPOS_CENTERED_MASK = 0x2FFF0000
  GL_CONTEXT_PROFILE_CORE = 0x0001
  GL_CONTEXT_PROFILE_COMPATIBILITY = 0x0002
  GL_CONTEXT_PROFILE_ES = 0x0004
  GL_CONTEXT_DEBUG_FLAG = 0x0001
  GL_CONTEXT_FORWARD_COMPATIBLE_FLAG = 0x0002
  GL_CONTEXT_ROBUST_ACCESS_FLAG = 0x0004
  GL_CONTEXT_RESET_ISOLATION_FLAG = 0x0008
  GL_CONTEXT_RELEASE_BEHAVIOR_NONE = 0x0000
  GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x0001
  GL_CONTEXT_RESET_NO_NOTIFICATION = 0x0000
  GL_CONTEXT_RESET_LOSE_CONTEXT = 0x0001
  PROP_DISPLAY_HDR_ENABLED_BOOLEAN = "SDL.display.HDR_enabled"
  PROP_DISPLAY_KMSDRM_PANEL_ORIENTATION_NUMBER = "SDL.display.KMSDRM.panel_orientation"
  PROP_WINDOW_CREATE_ALWAYS_ON_TOP_BOOLEAN = "SDL.window.create.always_on_top"
  PROP_WINDOW_CREATE_BORDERLESS_BOOLEAN = "SDL.window.create.borderless"
  PROP_WINDOW_CREATE_CONSTRAIN_POPUP_BOOLEAN = "SDL.window.create.constrain_popup"
  PROP_WINDOW_CREATE_FOCUSABLE_BOOLEAN = "SDL.window.create.focusable"
  PROP_WINDOW_CREATE_EXTERNAL_GRAPHICS_CONTEXT_BOOLEAN = "SDL.window.create.external_graphics_context"
  PROP_WINDOW_CREATE_FLAGS_NUMBER = "SDL.window.create.flags"
  PROP_WINDOW_CREATE_FULLSCREEN_BOOLEAN = "SDL.window.create.fullscreen"
  PROP_WINDOW_CREATE_HEIGHT_NUMBER = "SDL.window.create.height"
  PROP_WINDOW_CREATE_HIDDEN_BOOLEAN = "SDL.window.create.hidden"
  PROP_WINDOW_CREATE_HIGH_PIXEL_DENSITY_BOOLEAN = "SDL.window.create.high_pixel_density"
  PROP_WINDOW_CREATE_MAXIMIZED_BOOLEAN = "SDL.window.create.maximized"
  PROP_WINDOW_CREATE_MENU_BOOLEAN = "SDL.window.create.menu"
  PROP_WINDOW_CREATE_METAL_BOOLEAN = "SDL.window.create.metal"
  PROP_WINDOW_CREATE_MINIMIZED_BOOLEAN = "SDL.window.create.minimized"
  PROP_WINDOW_CREATE_MODAL_BOOLEAN = "SDL.window.create.modal"
  PROP_WINDOW_CREATE_MOUSE_GRABBED_BOOLEAN = "SDL.window.create.mouse_grabbed"
  PROP_WINDOW_CREATE_OPENGL_BOOLEAN = "SDL.window.create.opengl"
  PROP_WINDOW_CREATE_PARENT_POINTER = "SDL.window.create.parent"
  PROP_WINDOW_CREATE_RESIZABLE_BOOLEAN = "SDL.window.create.resizable"
  PROP_WINDOW_CREATE_TITLE_STRING = "SDL.window.create.title"
  PROP_WINDOW_CREATE_TRANSPARENT_BOOLEAN = "SDL.window.create.transparent"
  PROP_WINDOW_CREATE_TOOLTIP_BOOLEAN = "SDL.window.create.tooltip"
  PROP_WINDOW_CREATE_UTILITY_BOOLEAN = "SDL.window.create.utility"
  PROP_WINDOW_CREATE_VULKAN_BOOLEAN = "SDL.window.create.vulkan"
  PROP_WINDOW_CREATE_WIDTH_NUMBER = "SDL.window.create.width"
  PROP_WINDOW_CREATE_X_NUMBER = "SDL.window.create.x"
  PROP_WINDOW_CREATE_Y_NUMBER = "SDL.window.create.y"
  PROP_WINDOW_CREATE_COCOA_WINDOW_POINTER = "SDL.window.create.cocoa.window"
  PROP_WINDOW_CREATE_COCOA_VIEW_POINTER = "SDL.window.create.cocoa.view"
  PROP_WINDOW_CREATE_WAYLAND_SURFACE_ROLE_CUSTOM_BOOLEAN = "SDL.window.create.wayland.surface_role_custom"
  PROP_WINDOW_CREATE_WAYLAND_CREATE_EGL_WINDOW_BOOLEAN = "SDL.window.create.wayland.create_egl_window"
  PROP_WINDOW_CREATE_WAYLAND_WL_SURFACE_POINTER = "SDL.window.create.wayland.wl_surface"
  PROP_WINDOW_CREATE_WIN32_HWND_POINTER = "SDL.window.create.win32.hwnd"
  PROP_WINDOW_CREATE_WIN32_PIXEL_FORMAT_HWND_POINTER = "SDL.window.create.win32.pixel_format_hwnd"
  PROP_WINDOW_CREATE_X11_WINDOW_NUMBER = "SDL.window.create.x11.window"
  PROP_WINDOW_SHAPE_POINTER = "SDL.window.shape"
  PROP_WINDOW_HDR_ENABLED_BOOLEAN = "SDL.window.HDR_enabled"
  PROP_WINDOW_SDR_WHITE_LEVEL_FLOAT = "SDL.window.SDR_white_level"
  PROP_WINDOW_HDR_HEADROOM_FLOAT = "SDL.window.HDR_headroom"
  PROP_WINDOW_ANDROID_WINDOW_POINTER = "SDL.window.android.window"
  PROP_WINDOW_ANDROID_SURFACE_POINTER = "SDL.window.android.surface"
  PROP_WINDOW_UIKIT_WINDOW_POINTER = "SDL.window.uikit.window"
  PROP_WINDOW_UIKIT_METAL_VIEW_TAG_NUMBER = "SDL.window.uikit.metal_view_tag"
  PROP_WINDOW_UIKIT_OPENGL_FRAMEBUFFER_NUMBER = "SDL.window.uikit.opengl.framebuffer"
  PROP_WINDOW_UIKIT_OPENGL_RENDERBUFFER_NUMBER = "SDL.window.uikit.opengl.renderbuffer"
  PROP_WINDOW_UIKIT_OPENGL_RESOLVE_FRAMEBUFFER_NUMBER = "SDL.window.uikit.opengl.resolve_framebuffer"
  PROP_WINDOW_KMSDRM_DEVICE_INDEX_NUMBER = "SDL.window.kmsdrm.dev_index"
  PROP_WINDOW_KMSDRM_DRM_FD_NUMBER = "SDL.window.kmsdrm.drm_fd"
  PROP_WINDOW_KMSDRM_GBM_DEVICE_POINTER = "SDL.window.kmsdrm.gbm_dev"
  PROP_WINDOW_COCOA_WINDOW_POINTER = "SDL.window.cocoa.window"
  PROP_WINDOW_COCOA_METAL_VIEW_TAG_NUMBER = "SDL.window.cocoa.metal_view_tag"
  PROP_WINDOW_OPENVR_OVERLAY_ID = "SDL.window.openvr.overlay_id"
  PROP_WINDOW_VIVANTE_DISPLAY_POINTER = "SDL.window.vivante.display"
  PROP_WINDOW_VIVANTE_WINDOW_POINTER = "SDL.window.vivante.window"
  PROP_WINDOW_VIVANTE_SURFACE_POINTER = "SDL.window.vivante.surface"
  PROP_WINDOW_WIN32_HWND_POINTER = "SDL.window.win32.hwnd"
  PROP_WINDOW_WIN32_HDC_POINTER = "SDL.window.win32.hdc"
  PROP_WINDOW_WIN32_INSTANCE_POINTER = "SDL.window.win32.instance"
  PROP_WINDOW_WAYLAND_DISPLAY_POINTER = "SDL.window.wayland.display"
  PROP_WINDOW_WAYLAND_SURFACE_POINTER = "SDL.window.wayland.surface"
  PROP_WINDOW_WAYLAND_VIEWPORT_POINTER = "SDL.window.wayland.viewport"
  PROP_WINDOW_WAYLAND_EGL_WINDOW_POINTER = "SDL.window.wayland.egl_window"
  PROP_WINDOW_WAYLAND_XDG_SURFACE_POINTER = "SDL.window.wayland.xdg_surface"
  PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_POINTER = "SDL.window.wayland.xdg_toplevel"
  PROP_WINDOW_WAYLAND_XDG_TOPLEVEL_EXPORT_HANDLE_STRING = "SDL.window.wayland.xdg_toplevel_export_handle"
  PROP_WINDOW_WAYLAND_XDG_POPUP_POINTER = "SDL.window.wayland.xdg_popup"
  PROP_WINDOW_WAYLAND_XDG_POSITIONER_POINTER = "SDL.window.wayland.xdg_positioner"
  PROP_WINDOW_X11_DISPLAY_POINTER = "SDL.window.x11.display"
  PROP_WINDOW_X11_SCREEN_NUMBER = "SDL.window.x11.screen"
  PROP_WINDOW_X11_WINDOW_NUMBER = "SDL.window.x11.window"
  WINDOW_SURFACE_VSYNC_DISABLED = 0
  WINDOW_SURFACE_VSYNC_ADAPTIVE = -1

  # Enum

  SYSTEM_THEME_UNKNOWN = 0
  SYSTEM_THEME_LIGHT = 1
  SYSTEM_THEME_DARK = 2
  ORIENTATION_UNKNOWN = 0
  ORIENTATION_LANDSCAPE = 1
  ORIENTATION_LANDSCAPE_FLIPPED = 2
  ORIENTATION_PORTRAIT = 3
  ORIENTATION_PORTRAIT_FLIPPED = 4
  FLASH_CANCEL = 0
  FLASH_BRIEFLY = 1
  FLASH_UNTIL_FOCUSED = 2
  GL_RED_SIZE = 0
  GL_GREEN_SIZE = 1
  GL_BLUE_SIZE = 2
  GL_ALPHA_SIZE = 3
  GL_BUFFER_SIZE = 4
  GL_DOUBLEBUFFER = 5
  GL_DEPTH_SIZE = 6
  GL_STENCIL_SIZE = 7
  GL_ACCUM_RED_SIZE = 8
  GL_ACCUM_GREEN_SIZE = 9
  GL_ACCUM_BLUE_SIZE = 10
  GL_ACCUM_ALPHA_SIZE = 11
  GL_STEREO = 12
  GL_MULTISAMPLEBUFFERS = 13
  GL_MULTISAMPLESAMPLES = 14
  GL_ACCELERATED_VISUAL = 15
  GL_RETAINED_BACKING = 16
  GL_CONTEXT_MAJOR_VERSION = 17
  GL_CONTEXT_MINOR_VERSION = 18
  GL_CONTEXT_FLAGS = 19
  GL_CONTEXT_PROFILE_MASK = 20
  GL_SHARE_WITH_CURRENT_CONTEXT = 21
  GL_FRAMEBUFFER_SRGB_CAPABLE = 22
  GL_CONTEXT_RELEASE_BEHAVIOR = 23
  GL_CONTEXT_RESET_NOTIFICATION = 24
  GL_CONTEXT_NO_ERROR = 25
  GL_FLOATBUFFERS = 26
  GL_EGL_PLATFORM = 27
  HITTEST_NORMAL = 0
  HITTEST_DRAGGABLE = 1
  HITTEST_RESIZE_TOPLEFT = 2
  HITTEST_RESIZE_TOP = 3
  HITTEST_RESIZE_TOPRIGHT = 4
  HITTEST_RESIZE_RIGHT = 5
  HITTEST_RESIZE_BOTTOMRIGHT = 6
  HITTEST_RESIZE_BOTTOM = 7
  HITTEST_RESIZE_BOTTOMLEFT = 8
  HITTEST_RESIZE_LEFT = 9

  # Typedef

  typedef :uint, :SDL_DisplayID
  typedef :uint, :SDL_WindowID
  typedef :int, :SDL_SystemTheme
  typedef :int, :SDL_DisplayOrientation
  typedef :ulong_long, :SDL_WindowFlags
  typedef :int, :SDL_FlashOperation
  typedef :pointer, :SDL_GLContext
  typedef :pointer, :SDL_EGLDisplay
  typedef :pointer, :SDL_EGLConfig
  typedef :pointer, :SDL_EGLSurface
  typedef :long_long, :SDL_EGLAttrib
  typedef :int, :SDL_EGLint
  callback :SDL_EGLAttribArrayCallback, [:pointer], :pointer
  callback :SDL_EGLIntArrayCallback, [:pointer, :pointer, :pointer], :pointer
  typedef :int, :SDL_GLAttr
  typedef :uint, :SDL_GLProfile
  typedef :uint, :SDL_GLContextFlag
  typedef :uint, :SDL_GLContextReleaseFlag
  typedef :uint, :SDL_GLContextResetNotification
  typedef :int, :SDL_HitTestResult
  callback :SDL_HitTest, [:pointer, :pointer, :pointer], :int

  # Struct

  class DisplayMode < FFI::Struct
    layout(
      :displayID, :uint,
      :format, :int,
      :w, :int,
      :h, :int,
      :pixel_density, :float,
      :refresh_rate, :float,
      :refresh_rate_numerator, :int,
      :refresh_rate_denominator, :int,
      :internal, :pointer,
    )
  end


  # Function

  def self.setup_video_symbols(output_error = false)
    entries = [
      [:GetNumVideoDrivers, :SDL_GetNumVideoDrivers, [], :int],
      [:GetVideoDriver, :SDL_GetVideoDriver, [:int], :pointer],
      [:GetCurrentVideoDriver, :SDL_GetCurrentVideoDriver, [], :pointer],
      [:GetSystemTheme, :SDL_GetSystemTheme, [], :int],
      [:GetDisplays, :SDL_GetDisplays, [:pointer], :pointer],
      [:GetPrimaryDisplay, :SDL_GetPrimaryDisplay, [], :uint],
      [:GetDisplayProperties, :SDL_GetDisplayProperties, [:uint], :uint],
      [:GetDisplayName, :SDL_GetDisplayName, [:uint], :pointer],
      [:GetDisplayBounds, :SDL_GetDisplayBounds, [:uint, :pointer], :bool],
      [:GetDisplayUsableBounds, :SDL_GetDisplayUsableBounds, [:uint, :pointer], :bool],
      [:GetNaturalDisplayOrientation, :SDL_GetNaturalDisplayOrientation, [:uint], :int],
      [:GetCurrentDisplayOrientation, :SDL_GetCurrentDisplayOrientation, [:uint], :int],
      [:GetDisplayContentScale, :SDL_GetDisplayContentScale, [:uint], :float],
      [:GetFullscreenDisplayModes, :SDL_GetFullscreenDisplayModes, [:uint, :pointer], :pointer],
      [:GetClosestFullscreenDisplayMode, :SDL_GetClosestFullscreenDisplayMode, [:uint, :int, :int, :float, :bool, :pointer], :bool],
      [:GetDesktopDisplayMode, :SDL_GetDesktopDisplayMode, [:uint], :pointer],
      [:GetCurrentDisplayMode, :SDL_GetCurrentDisplayMode, [:uint], :pointer],
      [:GetDisplayForPoint, :SDL_GetDisplayForPoint, [:pointer], :uint],
      [:GetDisplayForRect, :SDL_GetDisplayForRect, [:pointer], :uint],
      [:GetDisplayForWindow, :SDL_GetDisplayForWindow, [:pointer], :uint],
      [:GetWindowPixelDensity, :SDL_GetWindowPixelDensity, [:pointer], :float],
      [:GetWindowDisplayScale, :SDL_GetWindowDisplayScale, [:pointer], :float],
      [:SetWindowFullscreenMode, :SDL_SetWindowFullscreenMode, [:pointer, :pointer], :bool],
      [:GetWindowFullscreenMode, :SDL_GetWindowFullscreenMode, [:pointer], :pointer],
      [:GetWindowICCProfile, :SDL_GetWindowICCProfile, [:pointer, :pointer], :pointer],
      [:GetWindowPixelFormat, :SDL_GetWindowPixelFormat, [:pointer], :int],
      [:GetWindows, :SDL_GetWindows, [:pointer], :pointer],
      [:CreateWindow, :SDL_CreateWindow, [:pointer, :int, :int, :ulong_long], :pointer],
      [:CreatePopupWindow, :SDL_CreatePopupWindow, [:pointer, :int, :int, :int, :int, :ulong_long], :pointer],
      [:CreateWindowWithProperties, :SDL_CreateWindowWithProperties, [:uint], :pointer],
      [:GetWindowID, :SDL_GetWindowID, [:pointer], :uint],
      [:GetWindowFromID, :SDL_GetWindowFromID, [:uint], :pointer],
      [:GetWindowParent, :SDL_GetWindowParent, [:pointer], :pointer],
      [:GetWindowProperties, :SDL_GetWindowProperties, [:pointer], :uint],
      [:GetWindowFlags, :SDL_GetWindowFlags, [:pointer], :ulong_long],
      [:SetWindowTitle, :SDL_SetWindowTitle, [:pointer, :pointer], :bool],
      [:GetWindowTitle, :SDL_GetWindowTitle, [:pointer], :pointer],
      [:SetWindowIcon, :SDL_SetWindowIcon, [:pointer, :pointer], :bool],
      [:SetWindowPosition, :SDL_SetWindowPosition, [:pointer, :int, :int], :bool],
      [:GetWindowPosition, :SDL_GetWindowPosition, [:pointer, :pointer, :pointer], :bool],
      [:SetWindowSize, :SDL_SetWindowSize, [:pointer, :int, :int], :bool],
      [:GetWindowSize, :SDL_GetWindowSize, [:pointer, :pointer, :pointer], :bool],
      [:GetWindowSafeArea, :SDL_GetWindowSafeArea, [:pointer, :pointer], :bool],
      [:SetWindowAspectRatio, :SDL_SetWindowAspectRatio, [:pointer, :float, :float], :bool],
      [:GetWindowAspectRatio, :SDL_GetWindowAspectRatio, [:pointer, :pointer, :pointer], :bool],
      [:GetWindowBordersSize, :SDL_GetWindowBordersSize, [:pointer, :pointer, :pointer, :pointer, :pointer], :bool],
      [:GetWindowSizeInPixels, :SDL_GetWindowSizeInPixels, [:pointer, :pointer, :pointer], :bool],
      [:SetWindowMinimumSize, :SDL_SetWindowMinimumSize, [:pointer, :int, :int], :bool],
      [:GetWindowMinimumSize, :SDL_GetWindowMinimumSize, [:pointer, :pointer, :pointer], :bool],
      [:SetWindowMaximumSize, :SDL_SetWindowMaximumSize, [:pointer, :int, :int], :bool],
      [:GetWindowMaximumSize, :SDL_GetWindowMaximumSize, [:pointer, :pointer, :pointer], :bool],
      [:SetWindowBordered, :SDL_SetWindowBordered, [:pointer, :bool], :bool],
      [:SetWindowResizable, :SDL_SetWindowResizable, [:pointer, :bool], :bool],
      [:SetWindowAlwaysOnTop, :SDL_SetWindowAlwaysOnTop, [:pointer, :bool], :bool],
      [:ShowWindow, :SDL_ShowWindow, [:pointer], :bool],
      [:HideWindow, :SDL_HideWindow, [:pointer], :bool],
      [:RaiseWindow, :SDL_RaiseWindow, [:pointer], :bool],
      [:MaximizeWindow, :SDL_MaximizeWindow, [:pointer], :bool],
      [:MinimizeWindow, :SDL_MinimizeWindow, [:pointer], :bool],
      [:RestoreWindow, :SDL_RestoreWindow, [:pointer], :bool],
      [:SetWindowFullscreen, :SDL_SetWindowFullscreen, [:pointer, :bool], :bool],
      [:SyncWindow, :SDL_SyncWindow, [:pointer], :bool],
      [:WindowHasSurface, :SDL_WindowHasSurface, [:pointer], :bool],
      [:GetWindowSurface, :SDL_GetWindowSurface, [:pointer], :pointer],
      [:SetWindowSurfaceVSync, :SDL_SetWindowSurfaceVSync, [:pointer, :int], :bool],
      [:GetWindowSurfaceVSync, :SDL_GetWindowSurfaceVSync, [:pointer, :pointer], :bool],
      [:UpdateWindowSurface, :SDL_UpdateWindowSurface, [:pointer], :bool],
      [:UpdateWindowSurfaceRects, :SDL_UpdateWindowSurfaceRects, [:pointer, :pointer, :int], :bool],
      [:DestroyWindowSurface, :SDL_DestroyWindowSurface, [:pointer], :bool],
      [:SetWindowKeyboardGrab, :SDL_SetWindowKeyboardGrab, [:pointer, :bool], :bool],
      [:SetWindowMouseGrab, :SDL_SetWindowMouseGrab, [:pointer, :bool], :bool],
      [:GetWindowKeyboardGrab, :SDL_GetWindowKeyboardGrab, [:pointer], :bool],
      [:GetWindowMouseGrab, :SDL_GetWindowMouseGrab, [:pointer], :bool],
      [:GetGrabbedWindow, :SDL_GetGrabbedWindow, [], :pointer],
      [:SetWindowMouseRect, :SDL_SetWindowMouseRect, [:pointer, :pointer], :bool],
      [:GetWindowMouseRect, :SDL_GetWindowMouseRect, [:pointer], :pointer],
      [:SetWindowOpacity, :SDL_SetWindowOpacity, [:pointer, :float], :bool],
      [:GetWindowOpacity, :SDL_GetWindowOpacity, [:pointer], :float],
      [:SetWindowParent, :SDL_SetWindowParent, [:pointer, :pointer], :bool],
      [:SetWindowModal, :SDL_SetWindowModal, [:pointer, :bool], :bool],
      [:SetWindowFocusable, :SDL_SetWindowFocusable, [:pointer, :bool], :bool],
      [:ShowWindowSystemMenu, :SDL_ShowWindowSystemMenu, [:pointer, :int, :int], :bool],
      [:SetWindowHitTest, :SDL_SetWindowHitTest, [:pointer, :SDL_HitTest, :pointer], :bool],
      [:SetWindowShape, :SDL_SetWindowShape, [:pointer, :pointer], :bool],
      [:FlashWindow, :SDL_FlashWindow, [:pointer, :int], :bool],
      [:DestroyWindow, :SDL_DestroyWindow, [:pointer], :void],
      [:ScreenSaverEnabled, :SDL_ScreenSaverEnabled, [], :bool],
      [:EnableScreenSaver, :SDL_EnableScreenSaver, [], :bool],
      [:DisableScreenSaver, :SDL_DisableScreenSaver, [], :bool],
      [:GL_LoadLibrary, :SDL_GL_LoadLibrary, [:pointer], :bool],
      [:GL_GetProcAddress, :SDL_GL_GetProcAddress, [:pointer], :pointer],
      [:EGL_GetProcAddress, :SDL_EGL_GetProcAddress, [:pointer], :pointer],
      [:GL_UnloadLibrary, :SDL_GL_UnloadLibrary, [], :void],
      [:GL_ExtensionSupported, :SDL_GL_ExtensionSupported, [:pointer], :bool],
      [:GL_ResetAttributes, :SDL_GL_ResetAttributes, [], :void],
      [:GL_SetAttribute, :SDL_GL_SetAttribute, [:int, :int], :bool],
      [:GL_GetAttribute, :SDL_GL_GetAttribute, [:int, :pointer], :bool],
      [:GL_CreateContext, :SDL_GL_CreateContext, [:pointer], :pointer],
      [:GL_MakeCurrent, :SDL_GL_MakeCurrent, [:pointer, :pointer], :bool],
      [:GL_GetCurrentWindow, :SDL_GL_GetCurrentWindow, [], :pointer],
      [:GL_GetCurrentContext, :SDL_GL_GetCurrentContext, [], :pointer],
      [:EGL_GetCurrentDisplay, :SDL_EGL_GetCurrentDisplay, [], :pointer],
      [:EGL_GetCurrentConfig, :SDL_EGL_GetCurrentConfig, [], :pointer],
      [:EGL_GetWindowSurface, :SDL_EGL_GetWindowSurface, [:pointer], :pointer],
      [:EGL_SetAttributeCallbacks, :SDL_EGL_SetAttributeCallbacks, [:SDL_EGLAttribArrayCallback, :SDL_EGLIntArrayCallback, :SDL_EGLIntArrayCallback, :pointer], :void],
      [:GL_SetSwapInterval, :SDL_GL_SetSwapInterval, [:int], :bool],
      [:GL_GetSwapInterval, :SDL_GL_GetSwapInterval, [:pointer], :bool],
      [:GL_SwapWindow, :SDL_GL_SwapWindow, [:pointer], :bool],
      [:GL_DestroyContext, :SDL_GL_DestroyContext, [:pointer], :bool],
    ]
    entries.each do |entry|
      attach_function entry[0], entry[1], entry[2], entry[3]
    rescue FFI::NotFoundError => e
      warn "[Warning] Failed to import #{entry[0]} (#{e})." if output_error
    end
  end

end

