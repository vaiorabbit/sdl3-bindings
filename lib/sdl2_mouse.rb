# Ruby-SDL3 : SDL3 wrapper for Ruby
#
# * https://github.com/vaiorabbit/sdl3-bindings
#
# [NOTICE] Autogenerated. Do not edit.

require 'ffi'

module SDL
  extend FFI::Library
  # Define/Macro

  BUTTON_LEFT = 1
  BUTTON_MIDDLE = 2
  BUTTON_RIGHT = 3
  BUTTON_X1 = 4
  BUTTON_X2 = 5

  # Enum

  SYSTEM_CURSOR_DEFAULT = 0
  SYSTEM_CURSOR_TEXT = 1
  SYSTEM_CURSOR_WAIT = 2
  SYSTEM_CURSOR_CROSSHAIR = 3
  SYSTEM_CURSOR_PROGRESS = 4
  SYSTEM_CURSOR_NWSE_RESIZE = 5
  SYSTEM_CURSOR_NESW_RESIZE = 6
  SYSTEM_CURSOR_EW_RESIZE = 7
  SYSTEM_CURSOR_NS_RESIZE = 8
  SYSTEM_CURSOR_MOVE = 9
  SYSTEM_CURSOR_NOT_ALLOWED = 10
  SYSTEM_CURSOR_POINTER = 11
  SYSTEM_CURSOR_NW_RESIZE = 12
  SYSTEM_CURSOR_N_RESIZE = 13
  SYSTEM_CURSOR_NE_RESIZE = 14
  SYSTEM_CURSOR_E_RESIZE = 15
  SYSTEM_CURSOR_SE_RESIZE = 16
  SYSTEM_CURSOR_S_RESIZE = 17
  SYSTEM_CURSOR_SW_RESIZE = 18
  SYSTEM_CURSOR_W_RESIZE = 19
  SYSTEM_CURSOR_COUNT = 20
  MOUSEWHEEL_NORMAL = 0
  MOUSEWHEEL_FLIPPED = 1

  # Typedef

  typedef :uint, :SDL_MouseID
  typedef :int, :SDL_SystemCursor
  typedef :int, :SDL_MouseWheelDirection
  typedef :uint, :SDL_MouseButtonFlags

  # Struct


  # Function

  def self.setup_mouse_symbols(output_error = false)
    symbols = [
      :SDL_HasMouse,
      :SDL_GetMice,
      :SDL_GetMouseNameForID,
      :SDL_GetMouseFocus,
      :SDL_GetMouseState,
      :SDL_GetGlobalMouseState,
      :SDL_GetRelativeMouseState,
      :SDL_WarpMouseInWindow,
      :SDL_WarpMouseGlobal,
      :SDL_SetWindowRelativeMouseMode,
      :SDL_GetWindowRelativeMouseMode,
      :SDL_CaptureMouse,
      :SDL_CreateCursor,
      :SDL_CreateColorCursor,
      :SDL_CreateSystemCursor,
      :SDL_SetCursor,
      :SDL_GetCursor,
      :SDL_GetDefaultCursor,
      :SDL_DestroyCursor,
      :SDL_ShowCursor,
      :SDL_HideCursor,
      :SDL_CursorVisible,
    ]
    apis = {
      :SDL_HasMouse => :HasMouse,
      :SDL_GetMice => :GetMice,
      :SDL_GetMouseNameForID => :GetMouseNameForID,
      :SDL_GetMouseFocus => :GetMouseFocus,
      :SDL_GetMouseState => :GetMouseState,
      :SDL_GetGlobalMouseState => :GetGlobalMouseState,
      :SDL_GetRelativeMouseState => :GetRelativeMouseState,
      :SDL_WarpMouseInWindow => :WarpMouseInWindow,
      :SDL_WarpMouseGlobal => :WarpMouseGlobal,
      :SDL_SetWindowRelativeMouseMode => :SetWindowRelativeMouseMode,
      :SDL_GetWindowRelativeMouseMode => :GetWindowRelativeMouseMode,
      :SDL_CaptureMouse => :CaptureMouse,
      :SDL_CreateCursor => :CreateCursor,
      :SDL_CreateColorCursor => :CreateColorCursor,
      :SDL_CreateSystemCursor => :CreateSystemCursor,
      :SDL_SetCursor => :SetCursor,
      :SDL_GetCursor => :GetCursor,
      :SDL_GetDefaultCursor => :GetDefaultCursor,
      :SDL_DestroyCursor => :DestroyCursor,
      :SDL_ShowCursor => :ShowCursor,
      :SDL_HideCursor => :HideCursor,
      :SDL_CursorVisible => :CursorVisible,
    }
    args = {
      :SDL_HasMouse => [],
      :SDL_GetMice => [:pointer],
      :SDL_GetMouseNameForID => [:uint],
      :SDL_GetMouseFocus => [],
      :SDL_GetMouseState => [:pointer, :pointer],
      :SDL_GetGlobalMouseState => [:pointer, :pointer],
      :SDL_GetRelativeMouseState => [:pointer, :pointer],
      :SDL_WarpMouseInWindow => [:pointer, :float, :float],
      :SDL_WarpMouseGlobal => [:float, :float],
      :SDL_SetWindowRelativeMouseMode => [:pointer, :bool],
      :SDL_GetWindowRelativeMouseMode => [:pointer],
      :SDL_CaptureMouse => [:bool],
      :SDL_CreateCursor => [:pointer, :pointer, :int, :int, :int, :int],
      :SDL_CreateColorCursor => [:pointer, :int, :int],
      :SDL_CreateSystemCursor => [:int],
      :SDL_SetCursor => [:pointer],
      :SDL_GetCursor => [],
      :SDL_GetDefaultCursor => [],
      :SDL_DestroyCursor => [:pointer],
      :SDL_ShowCursor => [],
      :SDL_HideCursor => [],
      :SDL_CursorVisible => [],
    }
    retvals = {
      :SDL_HasMouse => :bool,
      :SDL_GetMice => :pointer,
      :SDL_GetMouseNameForID => :pointer,
      :SDL_GetMouseFocus => :pointer,
      :SDL_GetMouseState => :uint,
      :SDL_GetGlobalMouseState => :uint,
      :SDL_GetRelativeMouseState => :uint,
      :SDL_WarpMouseInWindow => :void,
      :SDL_WarpMouseGlobal => :bool,
      :SDL_SetWindowRelativeMouseMode => :bool,
      :SDL_GetWindowRelativeMouseMode => :bool,
      :SDL_CaptureMouse => :bool,
      :SDL_CreateCursor => :pointer,
      :SDL_CreateColorCursor => :pointer,
      :SDL_CreateSystemCursor => :pointer,
      :SDL_SetCursor => :bool,
      :SDL_GetCursor => :pointer,
      :SDL_GetDefaultCursor => :pointer,
      :SDL_DestroyCursor => :void,
      :SDL_ShowCursor => :bool,
      :SDL_HideCursor => :bool,
      :SDL_CursorVisible => :bool,
    }
    symbols.each do |sym|
      begin
        attach_function apis[sym], sym, args[sym], retvals[sym]
      rescue FFI::NotFoundError => error
        $stderr.puts("[Warning] Failed to import #{sym} (#{error}).") if output_error
      end
    end
  end

end

