# Installation

## Deps
 - [`dot`](https://github.com/ubnt-intrepid/dot)

Install deps and run `git clone https://github.com/MabezDev/dotfiles .dotfiles` in home directory. Then run './install' inside of `.dotfiles`.

## Per machine configuration

### Per OS

`dot` manages cross os configs - see the `.mappings` TOML file.

### Per device

Some configs, like zshenv, i3 etc support different configs based on there hostname. See `zsh/.zsh_conf/` for an example of differences with mVoid laptop and mGentoo desktop.

# Misc

## Example xinitrc

```
xrdb merge $HOME/.Xresources   
/usr/bin/i3lock -e -u -i $HOME/.config/i3/icons/screen_lock_boot.png
/usr/bin/xautolock -detectsleep -time 5 -locker '$HOME/.config/i3/scripts/customlock.sh' &
exec ck-launch-session dbus-launch --sh-syntax --exit-with-session i3
```

This will merge Xresources, launch te initial lock screen for login
then set an autolock for 5minutes of afk, finally launch i3 with a consolekit session

## Detecting lid closing/suspend

`/etc/acpid/handler.sh` will handle all acpi events, find the button/lid case and append your lock code before `zzz` is invoked.

## Capturing font unicode points from the raw values

`echo -ne "\ue9b1" | xclip -selection clipboard` replacing `e9b1` with the 4 character hex code of your symbol. This puts the symbol in you clipboard ready for pasting into a config.

