#!/bin/bash
# runs jetpack

# TODO: use engr hosting to hold Jetpack executable.
# Current method: program sitting right in the repo.

if [$1 > 0]
then
echo "This script executes the jetpack installation. Choose whatever features you want."
echo "You can choose not to flash the TX2 since the Spacely BSP will be flashed later, but it doesn't matter. Leave everything default in the interest of ease."

read -p "Press any key if you understand and want to continue."
fi

# make jetpack executable
echo "Loading Jetpack..."
chmod +x JetPack-L4T-3.2-linux-x64_b196.run
./JetPack-L4T-3.2-linux-x64_b196.run
