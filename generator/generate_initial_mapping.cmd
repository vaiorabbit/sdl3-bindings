@echo off
set PYTHONPATH=.\clang
set PYTHONEXE=%LOCALAPPDATA%\Programs\Python\Python312\python.exe
%PYTHONEXE% generate_initial_cindex_mapping.py > sdl_cindex_mapping.json
%PYTHONEXE% generate_initial_define_mapping.py > sdl_define_mapping.json
