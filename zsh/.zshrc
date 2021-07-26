

# Font cripsness
export FT2_SUBPIXEL_HINTING=1

# Alias
alias mterm="python -m serial.tools.miniterm"
alias vim="nvim"
alias vi="nvim"

# for alacritty, now required on all because of 4:3 wide lg monitor reporting a weird dpi
export WINIT_X11_SCALE_FACTOR=1.0

source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
