#!/bin/bash
# installer.sh

#  Saves current directory
root_dir=$(pwd)

# Conditions for later executions
function run_if_selected {
    local condition="$1"
    local script_path="$2"
    if [ "$condition" = "true" ]; then
        if ! sudo -E "$script_path"; then
            echo "Error: Failed to run $script_path."
            echo "Skipped $script_path, check later..."
            sleep 1
        fi
    fi
}

# Get package sources and manager ready
if ! sudo apt update && sudo apt upgrade -y; then
    echo "Error: initial update and upgrade failed."
    echo "Verify your internet connection and retry."
    exit 1
fi

sudo apt-get install -y apt-transport-https

if [ "$pkg_manager" = "nala" ]; then
    if ! sudo apt install -y nala; then
        echo "Error: Failed to install Nala for APT."
        echo "Minbian will use stock APT defaults."
        pkg_manager="apt"
    fi
fi

clear

# Run core packages scripts
if ! sudo -E ./core-modules.sh; then
    echo "Error: Failed to run core-modules.sh."
    echo "Minbian relies on it, check and retry."
    exit 1
fi

if ! sudo -E ./core-desktop.sh; then
    echo "Error: Failed to run core-desktop.sh."
    echo "Minbian relies on it, check and retry."
    exit 1
fi

# Run scripts based on user input
run_if_selected "$bluetooth" "./additional/add-drivers.sh"
run_if_selected "$dev_apps" "./dev-software/add-fordev.sh"
run_if_selected "$dev_server" "./dev-software/add-server.sh"
run_if_selected "$office" "./additional/add-office.sh"
run_if_selected "$design" "./additional/add-design.sh"

# Run final settings script
if ! sudo ./additional/add-settings.sh; then
    echo "Error: Failed to run add-settings.sh."
fi

echo ""
echo "Minbian is done."
sleep 2
clear