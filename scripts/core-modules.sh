#!/bin/bash
# core-modules.sh

echo "Installing desktop system core modules..."
sleep 2

sudo nala install -y build-essential xbacklight xvkbd xbindkeys mtools acpi acpid gvfs-backends avahi-utils network-manager network-manager-gnome ufw curl brightnessctl htop neofetch

# Enables crucial system services
sudo systemctl enable acpid
sudo systemctl enable avahi-daemon
sudo systemctl enable NetworkManager

# Firewall configuration
sudo ufw enable
sudo ufw allow http
sudo ufw allow https
sudo ufw reload

echo "Success."
sleep 1
clear
