set PROJECT=SDL_sound
set VERSION=9000c2b27a6aa210c5ceb5821deae396d67aa4cd
set PREFIX=%PROJECT%-%VERSION%

if not exist intermediate (
    mkdir intermediate
)
curl -L https://github.com/icculus/SDL_sound/archive/%VERSION%.zip > intermediate/%PREFIX%.zip
cd intermediate
%WINDIR%\System32\tar.exe -xf %PREFIX%.zip
cd %PREFIX%/
if not exist build (
    mkdir build
)
cd build
set SDL3_DIR=../../../SDL/lib/cmake/SDL3
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=gcc ../
cmake --build .
cmake --install . --prefix ../../../SDL
