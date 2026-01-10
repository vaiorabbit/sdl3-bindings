#!/bin/sh
pushd .
cd ..
gem build sdl3-bindings.gemspec
popd
