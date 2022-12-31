#!/bin/bash

CMD=$1
NAME=$2
MAC=$(bluetoothctl devices | grep "Device" | grep $NAME | cut -d" " -f2)

# TODO use this to print battery level!
# Needed experimental = true in /etc/bluetooth/main.conf
# dbus-send --print-reply=literal --system --dest=org.bluez /org/bluez/hci0/dev_70_26_05_89_9F_28 org.freedesktop.DBus.Properties.Get string:"org.bluez.Battery1" string:"Percentage"

if [[ -z "$MAC" ]]; then
    echo "MISS"
    exit 1
fi

if [[ "$CMD" == "status" ]]; then
    if [[ $(bluetoothctl info $MAC | grep "Connected: " | cut -d" " -f2) == "yes" ]]; then
        echo "ON"
        # echo "%{F#f00}OFF" # TODO set colour based on battery level?
    else
        echo "OFF"
    fi

elif [[ "$CMD" == "connect" ]]; then
    if [[ $(bluetoothctl info $MAC | grep "Connected: " | cut -d" " -f2) == "no" ]]; then
        bluetoothctl connect $MAC
    fi
elif [[ "$CMD" == "disconnect" ]]; then
    bluetoothctl disconnect $MAC
fi
