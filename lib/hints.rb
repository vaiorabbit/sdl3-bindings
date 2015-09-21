module SDL2

  extend Fiddle::Importer

  SDL_HINT_FRAMEBUFFER_ACCELERATION            = "SDL_FRAMEBUFFER_ACCELERATION"
  SDL_HINT_RENDER_DRIVER                       = "SDL_RENDER_DRIVER"
  SDL_HINT_RENDER_OPENGL_SHADERS               = "SDL_RENDER_OPENGL_SHADERS"
  SDL_HINT_RENDER_DIRECT3D_THREADSAFE          = "SDL_RENDER_DIRECT3D_THREADSAFE"
  SDL_HINT_RENDER_DIRECT3D11_DEBUG             = "SDL_HINT_RENDER_DIRECT3D11_DEBUG"
  SDL_HINT_RENDER_SCALE_QUALITY                = "SDL_RENDER_SCALE_QUALITY"
  SDL_HINT_RENDER_VSYNC                        = "SDL_RENDER_VSYNC"
  SDL_HINT_VIDEO_ALLOW_SCREENSAVER             = "SDL_VIDEO_ALLOW_SCREENSAVER"
  SDL_HINT_VIDEO_X11_XVIDMODE                  = "SDL_VIDEO_X11_XVIDMODE"
  SDL_HINT_VIDEO_X11_XINERAMA                  = "SDL_VIDEO_X11_XINERAMA"
  SDL_HINT_VIDEO_X11_XRANDR                    = "SDL_VIDEO_X11_XRANDR"
  SDL_HINT_GRAB_KEYBOARD                       = "SDL_GRAB_KEYBOARD"
  SDL_HINT_MOUSE_RELATIVE_MODE_WARP            = "SDL_MOUSE_RELATIVE_MODE_WARP"
  SDL_HINT_VIDEO_MINIMIZE_ON_FOCUS_LOSS        = "SDL_VIDEO_MINIMIZE_ON_FOCUS_LOSS"
  SDL_HINT_IDLE_TIMER_DISABLED                 = "SDL_IOS_IDLE_TIMER_DISABLED"
  SDL_HINT_ORIENTATIONS                        = "SDL_IOS_ORIENTATIONS"
  SDL_HINT_ACCELEROMETER_AS_JOYSTICK           = "SDL_ACCELEROMETER_AS_JOYSTICK"
  SDL_HINT_XINPUT_ENABLED                      = "SDL_XINPUT_ENABLED"
  SDL_HINT_GAMECONTROLLERCONFIG                = "SDL_GAMECONTROLLERCONFIG"
  SDL_HINT_JOYSTICK_ALLOW_BACKGROUND_EVENTS    = "SDL_JOYSTICK_ALLOW_BACKGROUND_EVENTS"
  SDL_HINT_ALLOW_TOPMOST                       = "SDL_ALLOW_TOPMOST"
  SDL_HINT_TIMER_RESOLUTION                    = "SDL_TIMER_RESOLUTION"
  SDL_HINT_VIDEO_HIGHDPI_DISABLED              = "SDL_VIDEO_HIGHDPI_DISABLED"
  SDL_HINT_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK  = "SDL_MAC_CTRL_CLICK_EMULATE_RIGHT_CLICK"
  SDL_HINT_VIDEO_WIN_D3DCOMPILER               = "SDL_VIDEO_WIN_D3DCOMPILER"
  SDL_HINT_VIDEO_WINDOW_SHARE_PIXEL_FORMAT     = "SDL_VIDEO_WINDOW_SHARE_PIXEL_FORMAT"
  SDL_HINT_WINRT_PRIVACY_POLICY_URL            = "SDL_HINT_WINRT_PRIVACY_POLICY_URL"
  SDL_HINT_WINRT_PRIVACY_POLICY_LABEL          = "SDL_HINT_WINRT_PRIVACY_POLICY_LABEL"
  SDL_HINT_WINRT_HANDLE_BACK_BUTTON            = "SDL_HINT_WINRT_HANDLE_BACK_BUTTON"
  SDL_HINT_VIDEO_MAC_FULLSCREEN_SPACES         = "SDL_VIDEO_MAC_FULLSCREEN_SPACES"

  # SDL_HintPriority
  SDL_HINT_DEFAULT = 0
  SDL_HINT_NORMAL = 1
  SDL_HINT_OVERRIDE = 2

  def self.import_hints_symbols
    # function
    extern 'int SDL_SetHintWithPriority(const char*, const char*, int)'
    extern 'int SDL_SetHint(const char*, const char*)'
    extern 'const char* SDL_GetHint(const char*)'

    # TODO : SDL_HintCallback

    extern 'void SDL_ClearHints()'
  end

end

