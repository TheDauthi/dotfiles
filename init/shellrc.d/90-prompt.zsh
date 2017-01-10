# PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}'

# name@host:path$
function __create_prompt()
{
  local generated_prompt=''

  if [[ $UID -eq 0 ]]; then
    local __prompt_end_char='#'
    local __prompt_user_color='%{$fg_bold[red]%}'
    
  else
    local __prompt_end_char='$'
    local __prompt_user_color='%{$fg_bold[green]%}'
  fi

  local user_part=${__prompt_user_color}'%n%{$reset_color%}'
  local host_part='%{$fg_bold[green]%}@%m%{$reset_color%}'
  local path_part='%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}'
  local stop_part=$__prompt_end_char


  generated_prompt="${user_part}${host_part}:${path_part}${stop_part} "
  echo $generated_prompt
#  generated_prompt=$generated_prompt + 
#  generated_prompt=$generated_prompt + ':'
#  generated_prompt=$generated_prompt + '%{$fg_bold[blue]%}' + '${PWD/#$HOME/~}' + '%{$reset_color%}'
#  generated_prompt=$generated_prompt + $__prompt_end_char
}

PROMPT=$(__create_prompt)


RPROMPT='${return_status}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'
