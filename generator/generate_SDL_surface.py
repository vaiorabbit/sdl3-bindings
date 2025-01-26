import sdl_parser, sdl_generator

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_surface.h')
    sdl_parser.execute(ctx)

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx,
                            prefix = sdl_generator.PREFIX + "require_relative 'sdl3_rect'\n",
                            setup_method_name = 'surface'
    )
