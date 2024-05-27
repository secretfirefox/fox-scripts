#! /bin/bash

# This script was made by Secret Firefox.
# It aims to obtain and install missing firmware for the nvidia gpus using 340xx 
# drivers.
# This script cleans after itself when it's completed its job. Enjoy!

# Cleanup phase

sudo rm -rf /tmp/nouveau /lib/firmware/nouveau

# Install python 3 needed for installation to work

sudo apt install python3 wget

# Make a directory to work which will be wiped later on and change directory to it

mkdir /tmp/nouveau
cd /tmp/nouveau

# Get the script for extracting firmware from nvidia binary

wget https://raw.github.com/envytools/firmware/master/extract_firmware.py

# Get the nvidia binary

wget http://us.download.nvidia.com/XFree86/Linux-x86_64/340.108/NVIDIA-Linux-x86_64-340.108.run

# Extract stuff from the binary

sh NVIDIA-Linux-x86_64-340.108.run --extract-only

# Run the script to extract the firmware from the binary

python3 extract_firmware.py

# Make the directory where the firmware is going to be

sudo mkdir /lib/firmware/nouveau

# Move everything extracted to the proper firmware directory

sudo mv nv* vuc-* /lib/firmware/nouveau/ 

# Return to home directory and wipe the temporary installation directory

cd
sudo rm -rf /tmp/nouveau

echo "Installation complete!"




