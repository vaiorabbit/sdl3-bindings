import sdl_parser, sdl_generator

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_endian.h')
    sdl_parser.execute(ctx)

    ctx.decl_functions['_m_prefetch'] = None

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx, setup_method_name = 'endian')
