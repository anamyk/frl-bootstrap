#!/usr/bin/bash

# cat $HOME/.ssh/"$DEVICE"_id_ed25519.pub
echo ""
echo ">>> Add your <frl-<user>-ssh-key.pub> to your github and load FRL-ssh-keys on the machine"
read -p ">>> waiting ... when done type 'done' and press <Enter>: "
if [[ $REPLY = done ]]
then
    echo ">>> continuing ..."
    echo ""
else
    echo ">>> ERROR: a valid gitub ssh config is needed for the frl-scripts."
    echo ">>> Exiting ..."
    exit 1
fi

read -p ">>> Close Firefox. Is Firefox closed? ... if so, type 'closed' and press <Enter>: "
if [[ $REPLY = closed ]]; then
    echo ""
else
    echo ">>> ERROR: You need to close the programm first to avoid problems."
    echo ">>> Exiting ..."
    echo ""
    exit 1
fi

