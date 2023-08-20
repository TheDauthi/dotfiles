# SSH LC_ENV commands
# Pass some SSH stuff over LC_ENV

function build_prompt()
{
  if [ ! -z "ZSH_NAME" ] && [ -z "$fg_bold" ]; then
    autoload -U colors && colors
  fi

  local bash_prompt=\''[\\033[01;32m\]\\u@\\h\\[\\033[00m\\]:\\[\\033[01;34m\]\w\[\\033[00m\]\\$ '\'
  local zsh_prompt='%{$fg_bold[green]%}%n@%m%{$reset_color%}:%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}'
  local LOAD_PROMPT_CMD="[ ! -z \$BASH ] && PS1=${bash_prompt}"
  local LOAD_PROMPT_CMD="${LOAD_PROMPT_CMD}; [ ! -z \$ZSH_NAME ] && PROMPT='${zsh_prompt}'"
  echo -E $LOAD_PROMPT_CMD
}

function build_http_methods()
{
  echo -E ' for method in GET HEAD POST PUT DELETE TRACE OPTIONS; do alias "$method"="lwp-request -m ''$method'' "; done'
}

function generate_lc_env()
{
  local remote_prompt="$(build_prompt)"
  local remote_methods="$(build_http_methods)"
  LC_REMOTE_LOAD_COMMANDS=$(echo -E $remote_prompt";"$remote_methods)
}

generate_lc_env