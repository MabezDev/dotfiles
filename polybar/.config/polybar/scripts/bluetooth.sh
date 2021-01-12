#!/bin/bash

CMD=$1
NAME=$2
MAC=$(bluetoothctl paired-devices | grep "Device" | grep $NAME | cut -d" " -f2)

# make sure were connecting from the right controller on my desktop, should can be ignored on other platforms
# DEFAULT_CONTROLLER="00:1A:7D:DA:71:07"
# $(bluetoothctl select $DEFAULT_CONTROLLER) 

if [[ -z "$MAC" ]]; then
    echo "MISS"
    exit 1
fi

if [[ "$CMD" == "status" ]]; then
    if [[ $(bluetoothctl info $MAC | grep "Connected: " | cut -d" " -f2) == "yes" ]]; then
        echo "ON"
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
