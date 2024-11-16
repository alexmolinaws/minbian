#!/bin/bash
# core-desktop.sh

echo "Installing desktop environment..."
sleep 1

# Installs system fonts for compatibility
sudo nala install -y fonts-font-awesome fonts-terminus fonts-powerline fonts-liberation fonts-liberation2 fonts-crosextra-carlito fonts-crosextra-caladea

# Installs Xfce core modules and plugins
sudo nala install -y xfce4 xfce4-terminal xfce4-settings xfce4-notifyd xfce4-screenshooter xfce4-sensors-plugin xfce4-cpufreq-plugin xfce4-cpugraph-plugin xfce4-systemload-plugin xfce4-datetime-plugin xfce4-battery-plugin xfce4-xkb-plugin xfce4-fsguard-plugin xfce4-places-plugin xfce4-wavelan-plugin xfce4-clipman-plugin xfce4-notes-plugin xfce4-timer-plugin xfce4-whiskermenu-plugin thunar-archive-plugin thunar-media-tags-plugin lightdm-gtk-greeter-settings

# Installs default desktop GUI apps
sudo nala install -y synaptic mousepad gnome-calculator gpicview atril vlc firefox-esr

sudo systemctl enable lightdm

echo "Done."

echo ""
echo "LightDM will greet you at system start."
sleep 1

echo ""
echo "Success."
sleep 1
clear