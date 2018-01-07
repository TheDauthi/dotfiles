if [[ ! -e "${HOME}/.shellrc/plugins/fzf" ]]; then
  return
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.shellrc/plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.shellrc/plugins/fzf/shell/key-bindings.zsh"

export FZF_COMPLETION_TRIGGER=''
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"

bindkey '^T' fzf-completion
bindkey '^I' $fzf_default_completion
