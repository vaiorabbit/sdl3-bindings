set PROJECT=SDL_ttf
set VERSION=24990fdfd68936022d9b9f6158f80a48ad3c30ab
set PREFIX=%PROJECT%-%VERSION%

pushd .

if not exist intermediate (
    mkdir intermediate
)
if exist intermediate\%PREFIX% (
    rmdir /s /q intermediate\%PREFIX%
)

git clone --revision=%VERSION% --depth=1 https://github.com/libsdl-org/SDL_ttf.git intermediate\%PREFIX%

cd intermediate\%PREFIX%
if not exist build (
    mkdir build
)
powershell -executionpolicy remotesigned -File external\Get-GitModules.ps1
cd build
set SDL3_DIR=../../../SDL/lib/cmake/SDL3
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=gcc -D SDLTTF_VENDORED=ON ../
cmake --build .
cmake --install . --prefix ../../../SDL

popd
