#!/bin/zsh

while getopts ":i:" o; do
    case "${o}" in
        i)
            i=${OPTARG}
            ;;
    esac
done

[[ -z "$i" ]] && \
     { echo "Missing image -i"; exit 1; }

[[ -z "$LOCK_SCREEN_IMAGE" ]] && \
     { echo "LOCK_SCREEN_IMAGE not set"; exit 1; }

lock=$HOME/.config/i3/icons/grey-lock.png
resolution=$(xdpyinfo | grep dimensions | awk '{print $2}') 

ffmpeg -y -i $i -i $lock -filter_complex "scale=$resolution,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $LOCK_SCREEN_IMAGE > /dev/null 2>&1