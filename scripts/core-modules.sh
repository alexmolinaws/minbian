#!/bin/bash
# core-modules.sh

echo "Installing desktop system core modules..."
sleep 1

sudo nala install -y xorg xbacklight xbindkeys xvkbd xinput build-essential dialog mtools acpi acpid gvfs-backends avahi-utils neofetch htop ufw curl

echo ""
echo "Enabling display server and utilities..."

echo ""
sudo systemctl enable acpid
sudo systemctl enable avahi-daemon

echo "Getting key firewall settings done..."
sudo ufw enable
sudo ufw allow http
sudo ufw allow https
sudo ufw reload

echo ""
echo "Success."
sleep 1
clear