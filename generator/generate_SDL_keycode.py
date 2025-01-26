import sdl_parser, sdl_generator

# POSTFIX_KEYCODE = """
# # TODO #define KMOD_CTRL, #define KMOD_SHIFT, #define KMOD_ALT and #define KMOD_GUI
# """

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_keycode.h')
    sdl_parser.execute(ctx)

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx,
                            # postfix = sdl_generator.POSTFIX + POSTFIX_KEYCODE,
                            setup_method_name = 'keycode')
