# Load completions only for bash, until I figure out how to do it for zsh
if [ ! -z "$BASH_VERSION" ]; then
    complete -F __docker_containers_running docker-enter
fi
