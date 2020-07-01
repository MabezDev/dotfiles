#!/usr/bin/env bash

while getopts ":i:" o; do
    case "${o}" in
        i)
            i=${OPTARG}
            ;;
    esac
done

playerctl pause

lock=/home/mabez/.config/i3/icons/grey-lock.png
image_file=/tmp/screen_lock.png
image_file_final=/tmp/screen_lock_final.png
rm $image_file
rm $image_file_final

resolution=$(xdpyinfo | grep dimensions | awk '{print $2}') 
filters='boxblur=luma_radius=min(h\,w)/w*25'
#filters='frei0r=pixeliz0r:0.008|0.008'

if [[ -z "$i" ]]; then
  ffmpeg -f x11grab -video_size $resolution -y -i $DISPLAY -i $lock -filter_complex "$filters,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $image_file_final
else
  cp $i /tmp/input.png
  ffmpeg -y -i /tmp/input.png -i $lock -filter_complex "$filters,overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" -vframes 1 $image_file_final
fi

i3lock -e -u -i "$image_file_final"
