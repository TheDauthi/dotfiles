# Add some docker specific aliases for cleaning up
alias docker-clean="docker images --no-trunc | grep none | grep -v 'IMAGE'  | awk '{print \$3}' | xargs -r docker rmi"
alias docker-remove-stopped="docker ps -a --no-trunc --filter 'status=exited' -q | xargs -r docker rm"
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-remove-all='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias docker-last-image="docker images --no-trunc -q | head -n 1"
alias docker-last-container="docker ps -l -q"
alias docker-ip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

function docker-enter {
  docker exec -i -t $1 /bin/bash
}
complete -F __docker_containers_running docker-enter