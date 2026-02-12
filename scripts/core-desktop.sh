#!/bin/bash
# core-desktop.sh

echo "Installing desktop environment..."
sleep 2

# Installs system fonts for compatibility
sudo nala install -y fonts-font-awesome fonts-terminus fonts-powerline fonts-liberation fonts-liberation2 fonts-crosextra-carlito fonts-crosextra-caladea

# Installs core Xfce modules & plugins, and some apps
sudo nala install -y xfce4 xfce4-settings xfce4-notifyd xfce4-screenshooter xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-systemload-plugin xfce4-xkb-plugin  xfce4-battery-pluginxfce4-datetime-plugin xfce4-places-plugin xfce4-clipman-plugin xfce4-whiskermenu-plugin thunar-archive-plugin thunar-media-tags-plugin mate-terminal galculator gpicview atril vlc rhythmbox firefox-esr lightdm-gtk-greeter-settings

# Deletes any Xorg-related bloatware
sudo nala purge xterm xscreensaver* imagemagick*

sudo systemctl enable lightdm

echo ""
echo "Success."
sleep 1
clear
