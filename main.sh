#!/bin/bash
# main.sh

# Current version
mbv="v1.0.0"

echo "
------------------------------------------------------
|   __  __   _   _   _   ___     _   _____   _   _   |
|  |  \/  | | | | \ | | |  _ \  | | |  _  | | \ | |  |
|  |      | | | |  \| | | |_) | | | | |_| | |  \| |  |
|  | |\/| | | | |     | |  _ <  | | |  _  | |     |  |
|  | |  | | | | | |\  | | |_) | | | | | | | | |\  |  |
|  |_|  |_| |_| |_| \_| |____/  |_| |_| |_| |_| \_|  |
|                                                    |
----------------- DEBIAN DONE SMALL ------------------

|| "$mbv" | Minbian and The FOSS Community | GPL v3 ||
"
echo ""
echo "Welcome to the Minbian setup installation script!"
echo ""
echo "This will install a minimal debian desktop by doing:"
echo "- Debian GNU/Linux OS optimization for desktop use"
echo "- Desktop environment installation and settings"
echo "- Both general use and optional apps installation"
echo ""
echo "NOTE: proceed only if your user is in the sudo group."

echo ""
read -p "Are you ready to start? (y/n): " start_installation
while [[ ! "$start_installation" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with a 'y' or 'n': " start_installation
done

if [[ "$start_installation" =~ ^[nN]$ ]]; then
    clear
    echo "---| THANKS FOR TRYING OUT THE MINBIAN INSTALLER |---"
    sleep 1
    echo ""
    echo "If you had any struggles or doubts, visit:"
    echo "Repo: https://github.com/alexmolinaws/minbian"
    echo ""
    exit 0
fi

clear

# Install process customization
read -p "Does your PC have a 32-bit processor? (y/n): " arch_choice
while [[ ! "$arch_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' or 'n': " arch_choice
done
x86=$([[ "$arch_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""

read -p "Does it have less than 4 GB of RAM? (y/n): " ram_choice
while [[ ! "$ram_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' or 'n': " ram_choice
done
low_ram=$([[ "$ram_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""

read -p "Will you use hardware via Bluetooth? (y/n): " bt_choice
while [[ ! "$bt_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' or 'n': " bt_choice
done
bluetooth=$([[ "$bt_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""

read -p "Will you require a graphic code/text editor? (y/n): " dev_choice
while [[ ! "$dev_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' o 'n': " dev_choice
done
dev=$([[ "$dev_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

if "$dev"; then
    echo ""

    read -p "Want to also add an IDE for programming (y/n)?: " ide_choice
    while [[ ! "$ide_choice" =~ ^[yYnN]$ ]]; do
        read -p "Please, answer with 'y' o 'n': " ide_choice
    done
    ide=$([[ "$ide_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")
fi


if [ "$x86" = "false" ]; then
    echo ""
    read -p "Will you require an office suite (y/n): " office_choice
    while [[ ! "$office_choice" =~ ^[yYnN]$ ]]; do
        read -p "Please, answer with 'y' o 'n': " office_choice
    done
    office=$([[ "$office_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")
fi

echo ""

read -p "Will you require design software? (y/n): " design_choice
while [[ ! "$design_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' o 'n': " design_choice
done
design=$([[ "$design_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""
echo "Thank you! Your software has been selected,"
echo "Minbian will now install it automatically."

sleep 2
clear

# Install process logic starts

# Get package sources and manager ready
echo "Checking software updates..."

if ! sudo apt update && sudo apt upgrade -y; then
    echo "Error: packages update and upgrade failed."
    echo "Verify your internet connection and retry."
    exit 1
fi

if ! sudo apt-get install -y apt-transport-https; then
    echo "Error: failed adding apt-transport-https"
    echo "Verify your internet connection and retry."
    exit 1
fi

echo ""
echo "Installing front-end for APT..."
sudo apt install -y nala

clear

# Run standart setup scripts
if ! sudo ./scripts/core-modules.sh; then
    echo "Error: Failed to run core-modules.sh"
    echo "Minbian relies on it, check and retry."
    exit 1
fi

if ! sudo ./scripts/core-desktop.sh; then
    echo "Error: Failed to run core-desktop.sh"
    echo "Minbian relies on it, check and retry."
    exit 1
fi

# Install software based on choices
if [ "$bluetooth" = "true" ]; then
    sudo ./scripts/additional/add-drivers.sh
fi

if [ "$dev" = "true" ]; then
    echo "Installing software for development..."
    sleep 1

    if [ "$ide" = "true" ]; then
        sudo nala install -y pluma geany geany-plugins
    else
        sudo nala install -y pluma
    fi
    clear

    echo "Success."
    sleep 1
    clear
fi

if [ "$x86" = "false" ]; then
    if [ "$office" = "true" ]; then
        sudo ./scripts/additional/add-office.sh
    fi
fi

if [ "$design" = "true" ]; then
    sudo ./scripts/additional/add-design.sh
fi

echo ""
echo "Minbian is done."
sleep 2
clear

# Post-install message
echo "
------------------------------------------------------
|   __  __   _   _   _   ___     _   _____   _   _   |
|  |  \/  | | | | \ | | |  _ \  | | |  _  | | \ | |  |
|  |      | | | |  \| | | |_) | | | | |_| | |  \| |  |
|  | |\/| | | | |     | |  _ <  | | |  _  | |     |  |
|  | |  | | | | | |\  | | |_) | | | | | | | | |\  |  |
|  |_|  |_| |_| |_| \_| |____/  |_| |_| |_| |_| \_|  |
|                                                    |
----------------- DEBIAN DONE SMALL ------------------

|| "$mbv" | Minbian and The FOSS Community | GPL v3 ||
"
echo ""
echo "Installation complete! Thanks for trying Minbian!"
echo "Note: you've got 2 wallpapers in 'minbian' folder"
echo ""
echo "Reboot your system to apply all changes, & enjoy."
echo ""

exit 0
