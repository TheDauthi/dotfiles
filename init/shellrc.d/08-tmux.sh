tmux() {
  local _hostname=$(hostname -s)
  local SESSION=${1:-$_hostname}
  command tmux new -A -s "$SESSION"
}
