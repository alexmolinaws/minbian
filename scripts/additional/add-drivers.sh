#!/bin/bash
# add-drivers.sh

echo "Installing additional drivers..."
sleep 1

sudo nala -y install bluez blueman alsa-utils volumeicon-alsa
sudo systemctl enable enable bluetooth

echo "Success."
sleep 1
clear