# PYTHONPATH=/usr/local/Cellar/llvm/6.0.0/lib/python2.7/site-packages python generate_initial_define_mapping.py > sdl_define_mapping.json

import sdl_parser, sdl_generator

if __name__ == "__main__":
    sdl_parser.generate_define_list()
