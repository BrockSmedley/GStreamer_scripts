#!/bin/bash

# runs jetpack again to install stuff after BSP is flashed


TX2_ADDR='192.168.2.4'


# echo some instructions
echo "We need to launch Jetpack again to install software on top of our BSP image."
echo "Install whatever software you want to use. Default is everything."
echo
echo "! IMPORTANT: DO NOT flash the TX2 again!"
echo "! Do this: When prompted with the L4T Component Manager, set the Action field of \"Flash OS Image to Target\" to \"no action\"."
echo
echo "! ALSO, when prompted for the IP address, run ifconfig directly on the TX2 to get the IP address of the eth adapter."
echo

# Make user press enter to continue -- these instructions are mad important
read -p "If you understand what you need to do, press ENTER to continue..."
echo

# re-use script from step 1 w/o all the prompts
cd ../step1/
./jetpack.sh 1

# make some dots to space out different logical segments of the process
for ((i=1; i<=80; i++))
  do
    echo -n "."
  done

# prompt user to make sure they didn't accidentally flash the image
echo "Jetpack deployment complete. Please make sure the TX2 is still running."
echo
echo "If you accidentally flashed the TX2 with Jetson, press CTRL+C and repeat step 2 & 3."
echo
read -p "Press ENTER to continue..."

# deploy config script to TX2
cd ../step3/
# make dir to hold script
echo "$st Creating directory on TX2..."
sshpass -p "nvidia" ssh nvidia@$TX2_ADDR 'mkdir -p /home/nvidia/scripts/'
# copy script over scp
echo "$st Copying configuration scripts to TX2..."
sshpass -p "nvidia" scp config_TX2.sh nvidia@$TX2_ADDR:/home/nvidia/scripts/
sshpass -p "nvidia" scp buildOpenCV.sh nvidia@$TX2_ADDR:/home/nvidia/scripts/
# make script executable
echo "$st Setting file permissions on TX2..."
sshpass -p "nvidia" ssh nvidia@$TX2_ADDR 'chmod +x ~/scripts/config_TX2.sh;'
sshpass -p "nvidia" ssh nvidia@$TX2_ADDR 'chmod +x ~/scripts/buildOpenCV.sh;'
echo

# tell user to finish process on TX2
echo "[DONE] Nothing left to do on this machine. Log in to the TX2 and run"
echo " \$ sudo ~/scripts/config_TX2.sh"
