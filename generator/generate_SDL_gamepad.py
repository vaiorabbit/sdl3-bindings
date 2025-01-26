import sdl_parser, sdl_generator

TYPEDEF_PREFIX_GAMEPAD = """
  class GamepadBinding_value_axis < FFI::Struct
    layout(
        :axis, :int,
        :axis_min, :int,
        :axis_max, :int,
    )
  end

  class GamepadBinding_value_hat < FFI::Struct
    layout(
        :hat, :int,
        :hat_mask, :int,
    )
  end

  class GamepadBinding_input < FFI::Struct
    layout(
        :button, :int,
        :axis, GamepadBinding_value_axis,
        :hat, GamepadBinding_value_hat,
    )
  end

  class GamepadBinding_output < FFI::Struct
    layout(
        :button, :int,
        :axis, GamepadBinding_value_axis,
    )
  end

  class GamepadBinding < FFI::Struct
    layout(
        :input_type, :int,
        :input, GamepadBinding_input,
        :output_type, :int,
        :output, GamepadBinding_output,
    )
  end
"""

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_gamepad.h')
    sdl_parser.execute(ctx)

    # TODO : Merge anonymous structs into one union (e.g. SDL_RWops)
    #
    # SDL_GamepadBinding is a bit complicated so I unfortunately have to
    # substitute the parsed definition with my handwritten one.
    ctx.decl_structs['SDL_GamepadBinding'] = None

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx,
                            prefix = sdl_generator.PREFIX + "require_relative 'sdl3_joystick'\n",
                            typedef_prefix = TYPEDEF_PREFIX_GAMEPAD,
                            setup_method_name = 'gamepad'
    )
