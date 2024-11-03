#!/bin/bash
# add-drivers.sh

echo "Installing required drivers..."
sleep 2

sudo "$pkg_manager" -y install bluez blueman alsa-utils volumeicon-alsa
sudo systemctl enable enable bluetooth

echo ""
echo "Success."
sleep 2
clear