#!/bin/bash
set -e

pip install .

./Pangolin/scripts/install_prerequisites.sh recommended
mkdir Pangolin/build && cd Pangolin/build
cmake ..
make -j8
sudo make install
cd ../..

pip install ./DPViewer
ldconfig