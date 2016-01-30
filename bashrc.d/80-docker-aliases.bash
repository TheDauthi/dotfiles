# Add some docker specific aliases for cleaning up
function docker-clean() {
  docker images --no-trunc | grep none | grep -v 'IMAGE'  | awk '{print $3}' | xargs -r docker rmi
}

function docker-remote-stopped() {
  docker ps -a --no-trunc --filter 'status=exited' -q | xargs -r docker rm
}

function docker-stop-all() {
  docker stop $(docker ps -a -q)
}

function docker-remove-all() {
  docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
}

function docker-last-image() {
  docker images --no-trunc -q | head -n 1
}

function docker-last-container() {
  docker ps -l -q
}

function docker-ip() {
  docker inspect --format '{{ .NetworkSettings.IPAddress }}' "$@"
}

function docker-enter {
  docker exec -i -t $1 /bin/bash
}

docker() {
  if command -v "docker-$1" > /dev/null 2>&1; then
    subcommand=$1
    shift
    docker-$subcommand "$@"
  else
    command docker "$@"
  fi
}

complete -F __docker_containers_running docker-enter
