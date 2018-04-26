#!/bin/bash

# configures TX2 after being loaded with Jetpack & BSP

# import cuda pgp key
apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub

# update system
apt-get -y update
#apt-get -y upgrade

# conspicuous easter egg
echo "We should use Salt(Stack) for this..."

# install v4l-utils
apt-get -y install v4l-utils

# build opencv4tegra
  # get build_OpenCV.sh
  # run it
  # cd ~/opencv/build/
  # make #(sanity check)
  # sudo make install
  # sudo apt-get install cmake-curses-gui


echo
echo "All done. YAY!"
