import sdl_parser, sdl_generator

POSTFIX_AUDIO = """
# TODO : def SDL_LoadWAV
"""

if __name__ == "__main__":

    ctx = sdl_parser.ParseContext('./SDL3/SDL_audio.h')
    sdl_parser.execute(ctx)

    sdl_generator.sanitize(ctx)
    sdl_generator.generate(ctx, postfix = sdl_generator.POSTFIX + POSTFIX_AUDIO,
                            setup_method_name = 'audio',
    )
