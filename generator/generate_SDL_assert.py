import sdl_parser, sdl_generator

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_assert.h')
    sdl_parser.execute(ctx)

    ctx.decl_functions['__debugbreak'] = None

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx, setup_method_name = 'assert')
