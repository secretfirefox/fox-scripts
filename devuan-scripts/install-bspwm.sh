#!/bin/bash

# This script was made by Secret Firefox.
# This will install Bspwm on your existing Devuan install with some customization.
# It tries, however, to stay close to the bspwm defaults.
# This should work on other apt-based distros, but it is not guaranteed.
# Enjoy!

# Install bspwm, sxhkd, and dmenu (suckless tools)

sudo apt install bspwm sxhkd dmenu -y 

# Install the screenshot, wallpaper selector, and appearance utilities

sudo apt install maim xclip feh lxappearance -y 

# Install the terminal emulator (xfce4-terminal for transparency support)

sudo apt install xfce4-terminal -y 

# Install a file manager, a file extractor, and components for functionality inside the file manager
# This is optional if the ones you are using already do not suit Bspwm, or unnecessary if you are already on Xfce

#sudo apt install thunar thunar-archive-plugin xarchiver -y

# Install picom for compositing functionality

sudo apt install picom -y 

# Create the directories for bspwm and sxhkd; give it the necessary permissions and copy provided files to their places

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
cp -r bspwmrc ~/.config/bspwm/
cp -r sxhkdrc ~/.config/sxhkd/
chmod 755 ~/.config/bspwm/bspwmrc
chmod 644 ~/.config/sxhkd/sxhkdrc

# Copy the provided screenshooting script to the sxhkd directory

cp -r print-screen.sh ~/.config/sxhkd/print-screen.sh

# Generate a ~/.xinitrc for working dbus through startx 

sudo echo "exec bspwm" >> ~/.xinitrc

# Inform finished installation

echo "Installation complete! Reboot, login with your credentials then do startx!"

 


