#!/usr/bin/bash

setup_device () {
    echo ""
     
    echo "Configuring device variables ..."
    [[ -f $devicerc ]] && rm $devicerc

    [[ -f $devicerc ]] || touch $devicerc
    source $devicerc

    hostname=$(cat /etc/hostname)

    # if [[ $DEVICE == '' ]]; then
        # echo "... for the first time."
    read -p "Is name of device: $hostname (y/n)? " -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        DEVICE=$hostname
    else
        read -p "Enter a name for this device: "
        DEVICE=$REPLY
    fi
    # else
        # echo "... again for this device named '$DEVICE'."
    # fi

    setting="export DEVICE=$DEVICE"; grep -qxF "$setting" $devicerc || echo $setting >> $devicerc;

    echo ""
    echo "done: device named $DEVICE"
    echo ""
}

echo ""
echo ""

devicerc=$HOME/.devicerc
[[ -f $devicerc ]] && source $devicerc

if [[ -f $devicerc && $DEVICE != '' ]]; then
    echo "This deivce is already configured with .devicerc and devicename \"$DEVICE \"."
    read -p "Do you want to setup again (y/n)? "
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        setup_device
    fi
else
    setup_device
fi


# echo "Determine where to setup devie specific variables."
# read -p ">>> Default .devicerc for bash and zsh: press <Enter>. If you want bashrc type 'bashrc' and press <Enter>: "
# if [[ $REPLY = bashrc ]]; then
#     shellrc=$HOME/.bashrc
# else
#     shellrc=$HOME/.devicerc
#     echo "Setting up devicerc ..."
# fi


