if [[ ! -e "${HOME}/.shellrc/plugins/fzf" ]]; then
  return
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.shellrc/plugins/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.shellrc/plugins/fzf/shell/key-bindings.zsh"

