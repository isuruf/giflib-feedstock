#!/bin/bash

cp $RECIPE_DIR/CMakeLists.txt .
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$PREFIX ..
make -j$CPU_COUNT
if [[ "$target_platform" == linux* ]]; then
  make -C ../tests UTILS=$PWD
fi
make install
