#!/usr/bin/env bash

INTERFACE=$(ip route show | grep default | awk '{print $5}')
SECRET="acj"

if [ ! -z "$1" ]; then
    SECRET=$1
fi

# sudo apt update
# sudo apt install golang-go

# sudo apt install libx11-dev
# sudo apt install libxt-dev
# sudo apt install libxtst-dev

# go build -tags x11

chmod +x remote-touchpad
./remote-touchpad -bind $(ip addr show $INTERFACE | grep inet | head -n 1 | awk '{print $2}' | awk -F '/' '{print $1}' | sed 's/$/:1234/g') -move-speed 5 -secret $SECRET