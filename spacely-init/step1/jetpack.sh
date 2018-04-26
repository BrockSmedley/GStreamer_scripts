#!/bin/bash
# runs jetpack

# I decided not to include a download of Jetpack here because you need an account and it's too much of a PITA to deal with all that.
# So instead, I'm just including the jetpack executable in the source.
# A necessary evil.

if [$1 > 0]
then
echo "This script executes the jetpack installation. Choose whatever features you want."
echo "You can choose not to flash the TX2 since the Spacely BSP will be flashed later, but it doesn't matter. Leave everything default in the interest of ease."

read -p "Press any key if you understand and want to continue."
fi

# make jetpack executable
echo "Loading Jetpack..."
chmod +x JetPack-L4T-3.1-linux-x64.run
./JetPack-L4T-3.1-linux-x64.run


