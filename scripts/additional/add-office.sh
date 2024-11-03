#!/bin/bash
# add-office.sh

office_download="true"
office_message="Success."

echo "Installing the office suite..."
sleep 2

if [ "$low_memory" = "true" ]; then

    pkg_url="https://sourceforge.net/projects/openofficeorg.mirror/files/4.1.15/binaries/en-US/Apache_OpenOffice_4.1.15_Linux_x86_install-deb_en-US.tar.gz/download"

    pkg_name="Apache_OpenOffice.tar.gz"

    echo "Downloading Apache OpenOffice..."
    wget --show-progress "$pkg_url" -O "$pkg_name"

    if [ $? -ne 0 ]; then
        office_download="false"
        office_message="Skipping..."

        echo "Error: couldn't download suite."
    fi

    echo "Decompressing your software..."
    tar -xvf "$pkg_name"
    
    if [ $? -ne 0 ]; then
        office_download="false"
        office_message="Skipping..."

        echo "Error: couldn't download suite."
    fi

    if [ "$office_download" = "true" ]; then
        echo ""
        echo "Installing decompressed files..."
        sleep 1
        cd en-US/DEBS || { echo "Error: office suite folder not found."; sleep 2 }

        sudo dpkg -i *.deb

        echo "Installing desktop integration..."
        sleep 1
        cd desktop-integration || { echo "Error: can't open desktop-integration/"; echo "Check directory later to fix this."; sleep 2 }

        sudo dpkg -i *.deb

        # Installs missing dependencies, if exist
        sudo apt-get install -f

        # Back to directory to prevent errors
        cd "$root_dir" || { echo "Error: couldn't return to Minbian's directory."; exit 1; }
    fi

else
    sudo "$pkg_manager" install -y libreoffice
fi

clear

echo "$office_message"
sleep 2
clear