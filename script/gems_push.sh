#!/bin/sh
pushd .
cd ..
for i in `ls sdl3-bindings-*.gem`; do
    echo gem push $i
done
popd
