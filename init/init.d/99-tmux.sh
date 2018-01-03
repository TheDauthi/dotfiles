if [ -z "$TMUX" ]; then
  command tmux new -A -s "$(hostname -s)"
fi