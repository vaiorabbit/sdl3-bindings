PROJECT=SDL_ttf
VERSION=f9b636fc85b9355cea7482e9dd02c8be61060dc6
PREFIX=$PROJECT-$VERSION

#mkdir intermediate
#curl -L https://github.com/libsdl-org/$PROJECT/archive/$VERSION.zip > intermediate/$PREFIX.zip
cd intermediate
#unzip $PREFIX.zip
#mv $PREFIX $PROJECT
cd $PROJECT/
mkdir build
cd build
export MACOSX_DEPLOYMENT_TARGET=13.1
export SDL3_DIR=../../../SDL/lib/cmake/SDL3
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_OSX_ARCHITECTURES="arm64" -D BUILD_SHARED_LIBS=ON -D CMAKE_C_COMPILER=clang -D SDL3TTF_VENDORED=ON ../
cmake --build .
cmake --install . --prefix ../../../$PROJECT
