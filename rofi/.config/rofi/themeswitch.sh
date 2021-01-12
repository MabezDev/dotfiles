#!/bin/zsh
### Created by ilsenatorov
### Change WALLPAPERDIR to the directory where you store wallpapers

WALLPAPERDIR=$HOME/.wallpapers/

if [ -z $@ ]
then
function get_themes()
{
    ls $WALLPAPERDIR
}
echo current; get_themes
else
    THEMES=$@
    if [ x"current" = x"${THEMES}" ]
    then
        exit 0
    elif [ -n "${THEMES}" ]
    then
        # reload wal after, to update its theme
        wal -i $WALLPAPERDIR${THEMES} -o $HOME/.config/dunst/wal.sh  > /dev/null
        # create a new fresh boot lock screen, we do this async so we don't block rofi
        ($HOME/.config/i3/scripts/bootlock.sh -i $WALLPAPERDIR${THEMES} > /dev/null &)
    fi
fi