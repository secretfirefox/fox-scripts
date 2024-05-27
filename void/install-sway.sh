#!/bin/bash

# This script was made by Secret Firefox.
# This will install Swayfx on your Void Linux
# Enjoy!

# Install Sway window manager

sudo xbps-install swayfx swaybg swayidle swayimg swaykbdd swaylock sway-audio-idle-inhibit


# Install compatible xdg-portals

sudo xbps-install xdg-desktop-portal-wlr xdg-desktop-portal

# Install a wayland-compatible terminal emulator

sudo xbps-install foot

# Install dmenu

sudo xbps-install dmenu

# Install an image viewer, file manager, text-editor, calculator

sudo xbps-install feh nemo nemo-fileroller pluma mate-calc

# Copy the default configuration file 

mkdir ~/.config/sway 
cp -r /etc/sway/config ~/.config/sway


