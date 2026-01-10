set PROJECT=SDL_mixer
set VERSION=63f2c5a21760e3f1ad406ec8a8b18c6346f204b3
set PREFIX=%PROJECT%-%VERSION%

pushd .

if not exist intermediate (
    mkdir intermediate
)
curl -L https://github.com/libsdl-org/SDL_mixer/archive/%VERSION%.zip > intermediate/%PREFIX%.zip
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

popd
