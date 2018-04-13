# NOTE: a three-hash comment (###something), denotes a line that I still want to include but don't currently need (in cases of testing the script itself)


st="[STATUS]"


## STAGE 1: Environment config ################################################
# download CTI BSP r28.2
echo "$st Downloading Spacely BSP r28.2..."
wget http://www.connecttech.com/ftp/Drivers/CTI-L4T-V114.tgz
echo "[DONE]"
echo

# copy tarball to L4T install dir (step1)
echo "$st Copying BSP files to L4T install directory..."
cp CTI-L4T-V114.tgz ../step1/64_TX2/Linux_for_Tegra/
echo "[DONE]"
echo

# extract tarball
echo "$st Extracting firmware..."
cd ../step1/64_TX2/Linux_for_Tegra/
tar -xzvf ./CTI-L4T-V114.tgz
echo "[DONE]"
echo

# install Spacely BSP
echo "$st Installing Spacely BSP..."
cd ./CTI-L4T/
sudo ./install.sh
echo "[DONE]"


## STAGE 2: Flashing ##########################################################
# flash TX2 with new patch
echo "$st Flashing TX2 with BSP..."

# wait for user to activate USB Recovery Mode on the TX2
read -p "Please put the TX2 in Recovery mode and then press any key to continue..."
cd ../
sudo ./flash.sh spacely-imx274-3cam mmcblk0p1

## END ###
echo "Your TX2 should restart automatically when the installation finishes."
echo "If not, please wait or reboot the TX2 manually."
echo
echo "When the TX2 is booted up, press ENTER to proceed to the next step..."
