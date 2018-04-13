#!/bin/bash

# configures TX2 after being loaded with Jetpack & BSP

# import cuda pgp key
apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub

# update system
apt-get update
apt-get upgrade

# conspicuous easter egg
echo "We should use Salt(Stack) for this..."

# install OpenCV if it's not already installed

echo
echo "All done. YAY!"
