local ret_status="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
[ -n "$SSH_CLIENT" ] && prompt_text=" (SSH) " || prompt_text=" "
PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[cyan]%}%m%{$reset_color%}%{$fg[magenta]%}${prompt_text}${ret_status}%{$fg[cyan]%}%c%{$reset_color%} $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
