#!/bin/bash

set -e # Exit on error

echo "Starting system update..."

sudo apt update && sudo apt upgrade -y

sudo apt autoremove -y

echo
echo "System updated!"
echo 

if [ -f /var/run/reboot-required ]; then
    echo ""
    echo "!!! IMPORTANT: REBOOT NEEDED !!!"
    echo "Kernel or critical components were updated."
    echo ""
    [ -f /var/run/reboot-required.pkgs ] && cat /var/run/reboot-required.pkgs
    echo ""
    echo "Reboot when convenient (e.g. sudo reboot)"
    echo ""
else
    echo ""
    echo "Everything looks good — no reboot required."
    echo ""
fi
