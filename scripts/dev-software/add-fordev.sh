#!/bin/bash
# add-fordev.sh

selection="robust FOSS IDE (VSCodium)"

echo "Installing software for development..."
sleep 2

if [ "$ide_user" = "false" ]; then
    selection="code editor (Sublime Text)"
    echo "Selected a $selection"
    sleep 2
    # Installs GPG key for Sublime Text
    wget --show-progress - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null

    # Adds Sublime Text's repository
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

    sudo apt install -y sublime-text

else
    if [ "$x86" = "true" ]; then
        selection="lightweight FOSS IDE (Geany)"
        echo "Selected a $selection"
        sleep 2

        sudo "$pkg_manager" install -y geany geany-plugins
    else
        echo "Selected a $selection"
        sleep 2

        # Installs GPG key for VSCodium
        wget --show-progress - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
        | gpg --dearmor \
        | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg

        # Adds VSCodium's repository
        echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
        | sudo tee /etc/apt/sources.list.d/vscodium.list

        sudo apt install -y codium
    fi
fi

clear

echo "Success."
sleep 2
clear