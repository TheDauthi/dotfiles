PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}'

if [[ $UID -eq 0 ]]; then
    PROMPT="$PROMPT# "
else
    PROMPT="$PROMPT$ "
fi

RPROMPT='${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'
