# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Fix Ctrl+arrow word traversal in urvtx
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word

export EDITOR=vim

#export TERM=konsole
export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin
export PATH=$PATH:/home/mabez/programs/xtensa-esp32-elf/bin
export PATH=/usr/share/bcc/tools:$PATH
export IDF_PATH=/home/mabez/programs/esp-idf
# temp while gentoo stlink is broke
#export PATH=$PATH:$HOME/programs/stlink/build/Release
#export PATH=$PATH:$HOME/programs/arm-gcc/gcc-arm-none-eabi-6-2017-q2-update/bin
#export PATH=$PATH:/opt/cudnn6
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/cuda/lib64
#export CUDA_HOME=/opt/cuda/

export LIBVIRT_DEFAULT_URI="qemu:///system"
#export QEMU_AUDIO_DRV=alsa
#export QEMU_PA_SERVER=/run/user/1000/pulse/native
#export QEMU_PA_SINK=alsa_output.usb-C-Media_Electronics_Inc._USB_Audio_Device-00.analog-stereo
#export QEMU_PA_SOURCE=input

# Alias
alias mterm="python -m serial.tools.miniterm"

# Path to your oh-my-zsh installation.
#ZSH=$HOME/.oh-my-zsh/
export ZSH=/home/mabez/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
#ZSH_THEME="simple"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
source $HOME/.zshplugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zshplugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source $HOME/.zshplugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:sudo::' environ PATH="/sbin:/usr/sbin:$PATH" HOME="/root"

autoload -U compinit 
#promptinit
compinit
#promptinit; prompt gentoo



#neofetch