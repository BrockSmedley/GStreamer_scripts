#!/bin/bash

# executes each step of the TX2 spacely-imx274-3cam build process

cd ./step1/
./jetpack.sh

cd ../step2/
./spacely.sh

cd ../step3/
./post-install.sh
