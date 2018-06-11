#!/bin/bash

# executes each step of the TX2 spacely-imx274-3cam build process

cd ./step1/
./jetpack.sh

echo "Step 1 complete -- Jetpack installed."
read -p "Press ENTER to continue to step 2."

./spacely.sh

echo "Step 2 complete -- Spacely BSP installed."
read -p "Press ENTER to continue to step 3."

cd ../step3/
./post-install.sh
