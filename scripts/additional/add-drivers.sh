#!/bin/bash
# add-drivers.sh

echo "Installing additional drivers..."
sleep 2

sudo nala install -y bluez blueman alsa-utils volumeicon-alsa
sudo systemctl enable bluetooth

echo ""
echo "Success."
sleep 1
clear
