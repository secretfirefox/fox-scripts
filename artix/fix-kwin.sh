#!/bin/bash

# This script was made by Secret Firefox.
# This will fix animations being laggy in KDE Plasma. 
# Ideally, authorize and set this script to run upon boot, as the solution is only temporary (it is done in the /tmp directory).
# Enjoy!

# Make a directory in the /tmp for kwin cache

sudo mkdir /tmp/kwin

# Symlink the cache directory of kwin to the newly created directory
# This is done so kwin's cache is stored into RAM rather than somewhere in the disk, which speeds up animations significantly

sudo ln -s ~/.cache/kwin /tmp/kwin


