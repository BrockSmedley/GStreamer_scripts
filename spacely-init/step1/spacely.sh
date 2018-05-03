#!/bin/bash

# NOTE: a three-hash comment (###something), denotes a line that I still want to include but don't currently need (in cases of testing the script itself)


st="[STATUS]"
img="CTI-L4T-V112.tgz"

## STAGE 1: Environment config ################################################
# download CTI BSP r28.1
if [ ! -f ./$img ]
then
echo "$st Downloading Spacely BSP r28.1..."
wget http://www.connecttech.com/ftp/Drivers/$img
else
echo "$st Spacely BSP detected in local directory."
fi
echo "[DONE]"
echo

# copy tarball to L4T install dir (step1)
echo "$st Copying BSP files to L4T install directory..."
mv $img ./64_TX2/Linux_for_Tegra_tx2/
pwd
echo "[DONE]"
echo

# extract tarball
echo "$st Extracting firmware..."
cd ./64_TX2/Linux_for_Tegra_tx2/

pwd
tar -xzvf ./$img
echo "[DONE]"
echo

# install Spacely BSP
echo "$st Installing Spacely BSP..."
cd CTI-L4T/
pwd
sudo ./install.sh
echo "[DONE]"


## STAGE 2: Flashing ##########################################################
# flash TX2 with new patch
echo "$st Flashing TX2 with BSP..."

# wait for user to activate USB Recovery Mode on the TX2
read -p "Please put the TX2 in Recovery mode and then press any key to continue..."
cd ..
pwd
sudo ./flash.sh spacely-IMX274-3CAM mmcblk0p1

## END ###
echo "Your TX2 should restart automatically when the installation finishes."
echo "If not, please wait or reboot the TX2 manually."
echo "Next Step: Install software from Jetpack -- DO NOT FLASH OS."
