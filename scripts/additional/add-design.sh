#!/bin/bash
# add-design.sh

echo "Installing design software..."
sleep 1

if [ "$x86" = "true" ]; then
    sudo nala install -y inkscape gimp
else
    sudo nala install -y inkscape gimp krita
fi

clear

echo "Success."
sleep 1
clear