#!/bin/bash
# add-fordev.sh

echo "Installing software for development..."
sleep 1

# Adds GPG key for Sublime Text
wget --show-progress - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

# Adds Sublime Text's repository
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

sudo nala install -y sublime-text

if [ "$ide" = "true" ]; then
    if [ "$x86" = "true" ]; then
        sudo nala install -y geany geany-plugins
    else
        # Installs GPG key for VSCodium
        wget --show-progress - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
        | gpg --dearmor \
        | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

        # Adds VSCodium's repository
        echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
        | sudo tee /etc/apt/sources.list.d/vscodium.list

        sudo nala install -y codium
    fi
fi

clear

echo "Success."
sleep 1
clear