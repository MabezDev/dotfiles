#!/bin/bash

CMD=$1
NAME=$2
DEFAULT_CONTROLLER="00:1A:7D:DA:71:07"
MAC=$(echo -e 'paired-devices' | bluetoothctl | grep "Device" | grep $NAME | cut -d" " -f2)

if [[ "$CMD" == "status" ]]; then
    if [[ $(echo -e "info $MAC" | bluetoothctl | grep "Connected: " | cut -d" " -f2) == "no" ]]; then
        echo "OFF"
    else
        echo "ON"
    fi
elif [[ "$CMD" == "connect" ]]; then
    if [[ $(echo -e 'info' | bluetoothctl) != *"$NAME"* ]]; then
        # make sure were connecting from the right controller on my desktop, should can be ignored on other platforms
        $(echo -e "select $DEFAULT_CONTROLLER" | bluetoothctl) 
        $(echo -e "connect $MAC" | bluetoothctl)
    fi
elif [[ "$CMD" == "disconnect" ]]; then
    $(echo -e "disconnect" | bluetoothctl)
fi
