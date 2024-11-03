#!/bin/bash
# core-modules.sh

echo "Installing desktop system core modules..."
sleep 1

sudo "$pkg_manager" install -y xorg xbacklight xbindkeys xvkbd xinput build-essential dialog mtools acpi acpid gvfs-backends avahi-utils htop ufw curl

echo ""
echo "Enabling display server and utilities..."
sleep 1

sudo systemctl enable acpid
sudo systemctl enable avahi-daemon
sudo ufw enable

echo ""
echo "Success."
sleep 2
clear