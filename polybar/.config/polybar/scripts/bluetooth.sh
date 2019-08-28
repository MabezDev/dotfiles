#!/bin/bash

CMD=$1
NAME=$2
DEFAULT_CONTROLLER="00:1A:7D:DA:71:07"
MAC=$(echo -e 'paired-devices' | bluetoothctl | grep "Device" | grep $NAME | cut -d" " -f2)

if [[ -z "$MAC" ]]; then
    echo "MISS"
    exit 1
fi

if [[ "$CMD" == "status" ]]; then
    if [[ $(echo -e "info $MAC" | bluetoothctl | grep "Connected: " | cut -d" " -f2) == "yes" ]]; then
        echo "ON"
    else
        echo "OFF"
    fi
elif [[ "$CMD" == "connect" ]]; then
    if [[ $(echo -e "info $MAC" | bluetoothctl | grep "Connected: " | cut -d" " -f2) == "no" ]]; then
        # make sure were connecting from the right controller on my desktop, should can be ignored on other platforms
        $(echo -e "select $DEFAULT_CONTROLLER" | bluetoothctl) 
        $(echo -e "connect $MAC" | bluetoothctl)
    fi
elif [[ "$CMD" == "disconnect" ]]; then
    $(echo -e "disconnect $MAC" | bluetoothctl)
fi
