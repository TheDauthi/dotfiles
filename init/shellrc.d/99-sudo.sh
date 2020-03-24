sudo() {
    command sudo TMUX="$TMUX" SSH_AUTH_SOCK="$SSH_AUTH_SOCK" "$@"
}
