#!/usr/bin/env bash

image_file=/tmp/screen_lock.png
image_file_final=/tmp/screen_lock_final.png
rm $image_file
rm $image_file_final

resolution=$(xdpyinfo | grep dimensions | awk '{print $2}')
# filters='noise=alls=10,scale=iw*.05:-1,scale=iw*20:-1:flags=neighbor' 
filters='boxblur=luma_radius=min(h\,w)/100'
# lock_overlay='-i /home/mabez/.config/i3/icons/circlelockcleardark.png -filter_complex "overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2"'


ffmpeg -y -loglevel 0 -s "$resolution" -f x11grab -i $DISPLAY -vframes 1 \
  -vf "$filters" "$image_file"

ffmpeg -y -loglevel 0 -i $image_file -i /home/mabez/.config/i3/icons/locked-padlock.png -filter_complex \
"[1:v]scale=256:256 [ovrl], \
[0:v][ovrl]overlay=(main_w-overlay_w)/2:(main_h-overlay_h)/2" \
$image_file_final

# ffmpeg -y -s "$resolution" -i "$image_file" $lock_overlay  "$image_file"

i3lock -e -u -i "$image_file_final"

### OLD, slow with convert

# set the icon and a temporary location for the screenshot to be stored
# icon="$HOME/images/lock-icon-light.png"
# tmpbg='/tmp/screen.png'

# # take a screenshot
# scrot "$tmpbg"

# # blur the screenshot by resizing and scaling back up
# # convert "$tmpbg" -filter Gaussian -thumbnail 20% -sample 500% "$tmpbg"
# mogrify "$tmpbg" -filter Gaussian -resize %20 -define "filter:signma=1.5" -resize 500.5% "$tmpbg"

# # overlay the icon onto the screenshot
# # convert "$tmpbg" "$icon" -gravity center -composite "$tmpbg"

# # lock the screen with the blurred screenshot
# i3lock -i "$tmpbg" -u
