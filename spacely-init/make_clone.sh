if [ $1 ]
then
sudo ./flash.sh -r -k APP -G $1.img jetson-tx2 mmcblk0p1
else
echo "Please provide a name for the backup image."
echo "Example:"
echo -e "\t $ ./make_clone.sh backup"
fi
