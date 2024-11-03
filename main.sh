#!/bin/bash
# main.sh

# Current version
mbv="v1.0.0"

x86="false"
bluetooth="false"
dev_apps="false"
dev_server="false"
ide_user="false"
design="false"
office="false"
low_memory="false"
pkg_manager="apt"

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
echo "- General use and selectable apps installation"
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
    echo ""
    echo "1- Docs at https://github.com/alexmolinaws/minbian"
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
low_memory=$([[ "$ram_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""
read -p "Will you use hardware via Bluetooth? (y/n): " bt_choice
while [[ ! "$bt_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' or 'n': " bt_choice
done
bluetooth=$([[ "$bt_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""
read -p "Will you develop software on this PC? (y/n): " dev_choice
while [[ ! "$dev_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' o 'n': " dev_choice
done
dev_apps=$([[ "$dev_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

if "$dev_apps"; then
    echo ""
    read -p "Want to install an IDE for programming (y/n)?: " editor_choice
    while [[ ! "$editor_choice" =~ ^[yYnN]$ ]]; do
        read -p "Please, answer with 'y' o 'n': " editor_choice
    done
    ide_user=$([[ "$editor_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

    echo ""
    read -p "Want to install a local LAMP server? (y/n): " lamp_choice
    while [[ ! "$lamp_choice" =~ ^[yYnN]$ ]]; do
        read -p "Please, answer with 'y' o 'n': " lamp_choice
    done
    dev_server=$([[ "$lamp_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")
fi

echo ""
read -p "Will you require an office suite (y/n): " suite_choice
while [[ ! "$suite_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' o 'n': " suite_choice
done
office=$([[ "$suite_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""
read -p "Will you require a design tool? (y/n): " design_choice
while [[ ! "$design_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' o 'n': " design_choice
done
design=$([[ "$design_choice" =~ ^[yY]$ ]] && echo "true" || echo "false")

echo ""
echo "We're almost done. Last question:"
read -p "Will you add a frontend for APT? (y/n): " pm_choice
while [[ ! "$pm_choice" =~ ^[yYnN]$ ]]; do
    read -p "Please, answer with 'y' or 'n': " pm_choice
done

if [[ "$pm_choice" =~ ^[yY]$ ]]; then
    pkg_manager="nala"
fi

# Saving answers globally

export x86
export bluetooth
export dev_apps
export dev_server
export ide_user
export design
export office
export low_memory
export pkg_manager

clear
sleep 1

# Installation summary

echo "Thank you! Your software has been selected,"
echo "Minbian will now install it automatically."
echo ""
echo "NOTE: any data from you won't be collected."
sleep 5
clear

sudo -E ./scripts/installer.sh

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
echo ""
echo "The system will reboot in 6s to apply settings..."
sleep 6

# sudo reboot