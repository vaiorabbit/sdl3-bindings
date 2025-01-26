import sdl_parser, sdl_generator

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_log.h')
    sdl_parser.execute(ctx)

    ctx.decl_functions['SDL_LogMessageV'] = None

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx, setup_method_name = 'log')
