tmux() {
  if [[ -z "$1" ]]; then
    command tmux new -A -s "$(hostname -s)"
  else
    command tmux "$@"
  fi
}
