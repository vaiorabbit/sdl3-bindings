set PROJECT=SDL_ttf
set VERSION=6a13c7ab50f9dac8f618b7de3b6833e886a9cc7c
set PREFIX=%PROJECT%-%VERSION%

if not exist intermediate (
    mkdir intermediate
)
curl -L https://github.com/libsdl-org/SDL_ttf/archive/%VERSION%.zip > intermediate/%PREFIX%.zip
cd intermediate
%WINDIR%\System32\tar.exe -xf %PREFIX%.zip
cd %PREFIX%/
if not exist build (
    mkdir build
)
cd build
set SDL3_DIR=../../../SDL/lib/cmake/SDL3
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=gcc -D SDL_OPENGLES=OFF ../
cmake --build .
cmake --install . --prefix ../../../SDL
