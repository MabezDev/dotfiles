#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
#polybar main &
#polybar bar2 &

PRIMARY=$(xrandr --query | grep " primary" | cut -d" " -f1)
if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    if [ "$m" == "$PRIMARY" ]; then
      TRAY_POS="right" MONITOR=$m polybar --reload main &
    else
      MONITOR=$m polybar --reload main &
    fi
  done
else
  polybar --reload main &
fi

echo "Bars launched..."
