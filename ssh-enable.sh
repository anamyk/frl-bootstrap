#!/usr/bin/bash

cd $HOME
sudo apt update
sudo apt install ssh net-tools
sudo systemctl start ssh
sudo ufw allow 22
sudo systemctl restart ssh
sudo systemctl status ssh
