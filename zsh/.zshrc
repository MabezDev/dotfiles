

# for alacritty, now required on all because of 4:3 wide lg monitor reporting a weird dpi
export WINIT_X11_SCALE_FACTOR=1.0

# wal theming 
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
source ~/.cache/wal/colors.sh

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
