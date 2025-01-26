# PYTHONPATH=/usr/local/Cellar/llvm/7.0.0/lib/python2.7/site-packages python generate_initial_cindex_mapping.py > sdl_cindex_mapping.json

import sdl_parser, sdl_generator

if __name__ == "__main__":
    sdl_parser.generate_type_mapping()
