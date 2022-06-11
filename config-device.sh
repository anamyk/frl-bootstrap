#!/usr/bin/bash

echo ""

echo "Determine where to setup devie specific variables."
# read -p ">>> Do you work with .devicerc for bash and zsh or just .bashrc? ...type 'devicerc' or 'bashrc' and press <Enter> (default: devicerc): "
read -p ">>> Default .devicerc for bash and zsh. If you want just bashrc type 'bashrc' and press <Enter> (default: devicerc): "
if [[ $REPLY = bashrc ]]; then
    shellrc=$HOME/.bashrc
else
    shellrc=$HOME/.devicerc
    echo "Setting up devicerc ..."
fi


echo ""
echo "Configuring device variables ..."

[[ -f $shellrc ]] || touch $shellrc
source $shellrc

if [[ $DEVICE = '' ]]; then
    echo "... for the first time."
    read -p "Enter a name for this device: " DEVICE
    DEVICE=$DEVICE
else
    echo "... again for this device named '$DEVICE'."
fi

# if [[ $setup_type == linux ]]; then
#     if [[ $EMAIL = '' ]]; then
#         read -p "Enter a main email address: " EMAIL
#         EMAIL=$EMAIL
#     fi
# fi

setting="export DEVICE=$DEVICE"; grep -qxF "$setting" $shellrc || echo $setting >> $shellrc;
# setting="export EMAIL=$EMAIL"; grep -qxF "$setting" $shellrc || echo $setting >> $shellrc;

echo "done"
echo ""
