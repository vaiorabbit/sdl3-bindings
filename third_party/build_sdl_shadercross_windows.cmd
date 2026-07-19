set PROJECT=SDL_shadercross
set VERSION=e55cf5e31ced6f3d1be5cc6d0c50e99384f9f4ba
set PREFIX=%PROJECT%-%VERSION%
set COMMON_C_FLAGS=-O2 -DNDEBUG -static-libgcc
set COMMON_CXX_FLAGS=-O2 -DNDEBUG -static-libgcc -static-libstdc++
set COMMON_LINKER_FLAGS=-static-libgcc -static-libstdc++ -Wl,-Bstatic,--whole-archive -lwinpthread -Wl,--no-whole-archive,-Bdynamic
:: set COMMON_LINKER_FLAGS=-static-libgcc -static-libstdc++ -Wl,-Bstatic -lwinpthread
:: set COMMON_LINKER_FLAGS=-static-libgcc -static-libstdc++ -Wl,-Bstatic -lwinpthread -Wl,-Bdynamic

pushd .

if not exist intermediate (
    mkdir intermediate
)
::curl -L https://github.com/libsdl-org/SDL_shadercross/archive/%VERSION%.zip > intermediate/%PREFIX%.zip
cd intermediate
::%WINDIR%\System32\tar.exe -xf %PREFIX%.zip
cd %PREFIX%/

cd external/
powershell .\Get-GitModules.ps1
cd ..

cd build-scripts/
cmake -P download-prebuilt-DirectXShaderCompiler.cmake
cd ..

rem Build and install SPIRV-Cross so find_package(spirv_cross_*) works with SDLSHADERCROSS_VENDORED=OFF.
cmake -S external/SPIRV-Cross -B spirv_cross_build -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D SPIRV_CROSS_SHARED=ON -D SPIRV_CROSS_STATIC=OFF -D SPIRV_CROSS_CLI=OFF -D SPIRV_CROSS_ENABLE_TESTS=OFF -D CMAKE_C_FLAGS_RELEASE="%COMMON_C_FLAGS%" -D CMAKE_CXX_FLAGS_RELEASE="%COMMON_CXX_FLAGS%" -D CMAKE_SHARED_LINKER_FLAGS="%COMMON_LINKER_FLAGS%" -D CMAKE_INSTALL_PREFIX=%CD%/spirv_cross_prefix
cmake --build spirv_cross_build
cmake --install spirv_cross_build

if not exist build (
    mkdir build
)
cd build
set SDL3_DIR=../../../SDL/lib/cmake/SDL3
cmake -G "Unix Makefiles" -D CMAKE_BUILD_TYPE=Release -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=gcc -D SDLSHADERCROSS_SHARED=ON -D SDLSHADERCROSS_STATIC=OFF -D SDLSHADERCROSS_SPIRVCROSS_SHARED=ON -D SDLSHADERCROSS_VENDORED=OFF -D CMAKE_C_FLAGS_RELEASE="%COMMON_C_FLAGS%" -D CMAKE_CXX_FLAGS_RELEASE="%COMMON_CXX_FLAGS%" -D CMAKE_SHARED_LINKER_FLAGS="%COMMON_LINKER_FLAGS%" -D CMAKE_PREFIX_PATH=%CD%/../spirv_cross_prefix -D DirectXShaderCompiler_ROOT=../external/DirectXShaderCompiler-binaries/windows/bin/x64/ ../
cmake --build .
cmake --install . --prefix ../../../SDL

popd
