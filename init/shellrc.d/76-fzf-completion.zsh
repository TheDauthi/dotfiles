if [[ ! -e "${HOME}/.shellrc/plugins/fzf" ]]; then
  return
fi

# This means we failed to build/install the fzf binary
if ! command -v fzf >/dev/null 2>&1; then
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

bindkey '^G' fzf-completion
bindkey '^I' $fzf_default_completion
