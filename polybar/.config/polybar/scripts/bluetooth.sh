#!/bin/bash

CMD=$1
NAME=$2
MAC=$(echo -e 'paired-devices' | bluetoothctl | grep "Device" | grep "WH-1000XM2" | cut -d" " -f2)
# NAME="WH-1000XM2"
# MAC=$2
# echo "#1"

if [[ "$CMD" == "status" ]]; then
    if [[ $(echo -e 'info' | bluetoothctl | grep "Name: " | cut -d" " -f2) == *"$NAME"* ]]; then
        echo "ON"
    else
        echo "OFF"
    fi
elif [[ "$CMD" == "connect" ]]; then
    if [[ $(echo -e 'info' | bluetoothctl) != *"$NAME"* ]]; then
        $(echo -e "connect $MAC" | bluetoothctl)
    fi
elif [[ "$CMD" == "disconnect" ]]; then
    $(echo -e "disconnect" | bluetoothctl)
fi
