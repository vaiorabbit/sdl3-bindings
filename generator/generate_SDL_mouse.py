import sdl_parser, sdl_generator

# POSTFIX_MOUSE = """
# # TODO : def self.BUTTON(X); (1 << ((X)-1)); end;
# """

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_mouse.h')
    sdl_parser.execute(ctx)

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx,
                            # postfix = sdl_generator.POSTFIX + POSTFIX_MOUSE,
                            setup_method_name = 'mouse')
