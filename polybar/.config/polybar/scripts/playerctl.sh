#!/bin/sh
playerctl="playerctl --player=spotify"
player_status=$($playerctl status --player=spotify 2> /dev/null)

if [ "$player_status" = "Playing" ]; then
    echo "$($playerctl metadata artist) - $($playerctl metadata title)"
elif [ "$player_status" = "Paused" ]; then
    echo "$($playerctl metadata artist) - $($playerctl metadata title)"
else
    echo "Unknown status"
fi
