#!/bin/bash
# add-settings.sh

echo "Applying final desktop settings..."
sleep 1

WALLPAPER1="illustrated-wpp.jpg"
WALLPAPER2="photography-wpp.jpg"
DESTINATION="~/.local/share/backgrounds/"

ERROR_TXT="Couldn't change image in lightdm.conf. Skipping..."

sudo cp "media/$WALLPAPER1" "$DESTINATION/"
sudo cp "media/$WALLPAPER2" "$DESTINATION/"

xfconf-query -c xfce4-desktop -p /desktop-background -s "$DESTINATION/$WALLPAPER1"

# Sets LightDM background
if [ -f /etc/lightdm/lightdm.conf ]; then
    if sudo sed -i "s|^#background=.*|background=$DESTINATION/$WALLPAPER2|" /etc/lightdm/lightdm.conf; then
        echo "Login screen background changed successfully."
    else
        echo $ERROR_TXT
    fi
else
    echo ""
    echo $ERROR_TXT
fi

# Sets desktop theme and icons
xfconf-query -c xsettings -p /Net/ThemeName -s "Greybird"
xfconf-query -c xsettings -p /Net/IconThemeName -s "Adwaita"
xfconf-query -c xfwm4 -p /theme -s "Greybird"

echo ""
echo "Success."
sleep 1
clear