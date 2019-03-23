#!/bin/bash

CMD=$1
NAME=$2
MAC=$(echo -e 'paired-devices' | bluetoothctl | grep "Device" | grep $NAME | cut -d" " -f2)


if [[ "$CMD" == "status" ]]; then
    if [[ $(echo -e "info $MAC" | bluetoothctl | grep "Connected: " | cut -d" " -f2) == "yes" ]]; then
        echo "ON"
    else
        echo "OFF"
    fi
elif [[ "$CMD" == "connect" ]]; then
    if [[ $(echo -e "info $MAC" | bluetoothctl | grep "Connected: " | cut -d" " -f2) == "no" ]]; then
        $(echo -e "connect $MAC" | bluetoothctl)
    fi
elif [[ "$CMD" == "disconnect" ]]; then
    $(echo -e "disconnect $MAC" | bluetoothctl)
fi
