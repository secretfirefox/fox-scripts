# This script was made by Secret Firefox.
# This will perform my custom post-installation on Void Linux.
# Enjoy!

# Ensure the system is up-to-date

sudo xbps-install -Syu

# Add the nonfree repository

sudo xbps-install -Rs void-repo-nonfree -y

# Install some recommended packages

sudo xbps-install curl wget git xz unzip zip nano gptfdisk xtools mtools mlocate ntfs-3g fuse-exfat bash-completion linux-headers gtksourceview4 ffmpeg mesa-vdpau mesa-vaapi htop numlockx xmirror -y

# Install some development packages

sudo xbps-install autoconf automake bison m4 make libtool flex meson ninja optipng sassc -y

# Install xorg and wayland window systems

sudo xbps-install xorg wayland -y

# Install some xdg utilities

sudo xbps-install xdg-user-dirs xdg-utils -y

# Install dbus, elogind and network manager

sudo xbps-install dbus elogind NetworkManager -y

# Disable dhcpcd and wpa_supplicant

sudo sv down dhcpcd wpa_supplicant

sudo touch /etc/sv/dhcpcd/down
sudo touch /etc/sv/wpa_supplicant/down

# Enable dbus, elogind and NetworkManager

sudo ln -s /etc/sv/dbus /var/service
sudo ln -s /etc/sv/elogind /var/service
sudo ln -s /etc/sv/NetworkManager /var/service
sudo sv up dbus
sudo sv up elogind
sudo sv up NetworkManager

# Install the audio server

sudo xbps-install pipewire wireplumber -y

# Install cronie

sudo xbps-install cronie -y
sudo ln -s /etc/sv/cronie /var/service

# Install Noto Fonts

sudo xbps-install noto-fonts-emoji noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-cjk -y

# Install Firefox, and set a better font for it

sudo xbps-install firefox firefox-i18n-en-VS
sudo ln -s /usr/share/fontconfig/conf.avail/70-no-bitmaps.conf /etc/fonts/conf.d/
sudo xbps-reconfigure -f -y fontconfig

# Install a loggin daemon

sudo xbps-install -Rs socklog-void -y
sudo ln -s /etc/sv/socklog-unix /var/service
sudo ln -s /etc/sv/nanoklogd /var/service

# Install Profile Sync Daemon for faster browser and less ram usage

git clone https://github.com/madand/runit-services
cd runit-services
sudo mv psd /etc/sv/
sudo ln -s /etc/sv/psd/ /var/service/
sudo chmod +x /etc/sv/psd/*

# Install NTP Daemon Chrony

sudo xbps-install chrony
sudo ln -s /etc/sv/chronyd /var/service

# Inform finished installation

echo "Installation complete!"


