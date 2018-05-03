#!/bin/bash

# configures TX2 after being loaded with Jetpack & BSP

# import cuda pgp key
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub

# update system
sudo apt-get -y update
#apt-get -y upgrade

# conspicuous easter egg
echo "We should use Salt(Stack) for this..."

# install pip
sudo apt install -y python-pip
# update pip
sudo pip install --upgrade pip

# thanks https://gist.github.com/SSARCandy/fc960d8905330ac695e71e3f3807ce3d & Shu-Ping
# install openCV dependencies
sudo apt-get install -y build-essential
sudo apt-get install -y cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev curl
sudo apt-get install -y python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev
sudo apt-get install -y qttools5-dev qttools5-dev-tools

# run openCV build script
sudo ./buildOpenCV.sh

# install opencv to OS
cd ~/opencv/build/
sudo make install

# config openCV to link library files
sudo sh -c 'echo "/usr/local/lib" > /etc/ld.so.conf.d/opencv.conf'

#sudo ldconfig
echo "OpenCV installed."

echo
echo "All done with this. Now install CUDA and TensorRT from Jetpack. YAY! (It might actually make more sense to do that stuff first."
