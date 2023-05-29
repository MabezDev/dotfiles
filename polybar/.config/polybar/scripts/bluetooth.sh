#!/bin/bash

CMD=$1
NAME=$2
MAC=$(bluetoothctl devices | grep "Device" | grep $NAME | cut -d" " -f2)
MAC_UNDERSCORE=$(echo $MAC | tr : _)

if [[ -z "$MAC" ]]; then
    echo "MISS"
    exit 1
fi

if [[ "$CMD" == "status" ]]; then
    if [[ $(bluetoothctl info $MAC | grep "Connected: " | cut -d" " -f2) == "yes" ]]; then
        BATTERY=$(dbus-send --print-reply=literal --system --dest=org.bluez /org/bluez/hci0/dev_$MAC_UNDERSCORE org.freedesktop.DBus.Properties.Get string:"org.bluez.Battery1" string:"Percentage" 2>/dev/null | cut -d" " -f 12)
        if ! [ -z "$BATTERY" ]; then
            if [[ $BATTERY -le 20 ]]; then
                echo "%{F#f00}$BATTERY%%{F-}"
            else
                echo "$BATTERY%"
            fi
        else
            echo "ON"
        fi
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
