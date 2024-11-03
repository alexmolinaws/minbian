#!/bin/bash
# add-design.sh

std_app="inkscape"

echo "Installing design software..."
sleep 2

if ["$low_memory" = "true" ]; then
    sudo "$pkg_manager" install -y "$std_app"
else
    if [ "$x86" = "true" ]; then
        sudo "$pkg_manager" install -y "$std_app" gimp
    else
        sudo "$pkg_manager" install -y "$std_app" gimp krita blender
    fi
fi

clear

echo "Success."
sleep 2
clear