if [[ ! -e "${HOME}/.shellrc/plugins/fzf" ]]; then
  return
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "${HOME}/.shellrc/plugins/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "${HOME}/.shellrc/plugins/fzf/shell/key-bindings.bash"

complete -F _fzf_dir_completion -o default -o bashdefault tree

export FZF_COMPLETION_TRIGGER=''
bind '"\C-t": fzf-completion'
bind '"\C-i": $fzf_default_completion'