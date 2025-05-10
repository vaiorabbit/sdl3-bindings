@echo off
setlocal
pushd .

:: call build_sdl_windows.cmd
call build_sdl_image_windows.cmd
call build_sdl_mixer_windows.cmd
call build_sdl_sound_windows.cmd
call build_sdl_ttf_windows.cmd

popd
