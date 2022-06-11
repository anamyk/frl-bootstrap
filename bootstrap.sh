#!/usr/bin/bash

echo "********************************************"
echo "****** bootstrap FRL linux *******"
echo "********************************************"
echo "The following basics will be configured:"
echo "    - your device with device-name and email"
echo "    - setup of device specific .devicerc"
echo "    - ssh-keys"
echo "    - add your devive-sshkeys to the"
echo "      private gitrepo for machine setup"
echo ""
echo "This might overwrite customization that you may have done."
echo "Consecutive runs of the script are possible."
echo "However don't forget to use new shell or source your dotfiles."
read -p "Are you sure (y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]
then
    echo ""

    if echo $PREFIX | grep -o "com.termux"; then
        setup_type=termux
    else
        setup_type=linux
    fi

    if [[ $setup_type = linux ]]; then
        echo ""
        echo "Upgrading and installing packages ..."
        sudo apt update
        sudo apt upgrade
        sudo apt install git vim-gtk3 ssh wget
    elif [[ $setup_type = termux ]]; then
        echo ""
        echo "Upgrading and installing packages ..."
        pkg up
        pkg install git vim tree openssh wget
    fi
    . config-device.sh
    . ssh-add.sh
fi
