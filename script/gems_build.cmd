@echo off
pushd %CD%
cd ..
call gem.cmd build sdl3-bindings.gemspec
popd
