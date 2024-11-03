#!/bin/bash
# add-settings.sh

echo "Applying final desktop settings..."
sleep 2

wallpaper1="illustrated-wpp.jpg"
wallpaper2="photography-wpp.jpg"
destination_dir="~/.local/share/backgrounds/"

sudo cp "media/$wallpaper1" "$destination_dir/"
sudo cp "media/$wallpaper2" "$destination_dir/"

xfconf-query -c xfce4-desktop -p /desktop-background -s "$destination_dir/$wallpaper1"

# Sets LightDM background

if [ -f /etc/lightdm/lightdm.conf ]; then
    if sudo sed -i "s|^#background=.*|background=$destination_dir/$wallpaper2|" /etc/lightdm/lightdm.conf; then
        echo "Login screen background changed successfully."
    else
        echo "NOTE: Couldn't change background in lightdm.conf."
    fi
else
    echo ""
    echo "NOTE: Couldn't change background in lightdm.conf."
    sleep 2
fi

# Sets desktop theme and icons

xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
xfconf-query -c xfwm4 -p /theme -s "Greybird"

sleep 1
clear

echo "Success."
sleep 2
clear
