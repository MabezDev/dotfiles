# Installation

## Deps
 - GNU stow
 - oh-my-zsh

Install deps and run `git clone --recursive .dotfiles` in home directory. Then run './install {type}' inside of `.dotfiles` where `type` can be `laptop` or `desktop`.

## Example xinitrc

```
xrdb merge $HOME/.Xresources   
/usr/bin/i3lock -e -u -i /home/mabez/.config/i3/icons/screen_lock_boot.png
/usr/bin/xautolock -detectsleep -time 5 -locker '/home/mabez/.config/i3/scripts/customlock.sh' &
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
```

This will merge Xresources, launch te initial lock screen for login
then set an autolock for 5minutes of afk, finally launch i3 with a consolekit session

## Detecting lid closing/suspend

`/etc/acpid/handler.sh` will handle all acpi events, find the button/lid case and append your lock code before `zzz` is invoked.

