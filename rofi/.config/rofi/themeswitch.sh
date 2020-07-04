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
        wal -i $WALLPAPERDIR${THEMES} > /dev/null
    fi
fi