import sdl_parser, sdl_generator

# TYPEDEF_PREFIX_JOYSTICK = """
#   JoystickGUID = SDL::GUID
# """

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_joystick.h')
    sdl_parser.execute(ctx)

    # ctx.decl_structs['JoystickGUID'] = None

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx,
                            prefix = sdl_generator.PREFIX + "require_relative 'sdl3_guid'\n",
                            # typedef_prefix = TYPEDEF_PREFIX_JOYSTICK,
                            setup_method_name = 'joystick')
