####
# Docker alias
# This docker alias also adds the additional commands defined below
# On no match, it will pass the commands off to docker itself
dk() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dk
Usage: dk [docker-commands ...]

Shortcut for docker, adding new docker aliases as commands.
HELP
return; fi  
  case "$1" in
    "sh")
      shift
      dksh "$@"
      ;;
    "ex")
      shift
      dkex "$@"
      ;;
    "fsi")
      shift
      dkfsu "$@"
      ;;
    "fse")
      shift
      dkfse "$@"
      ;;
    *)
      docker "$@"
    ;;
  esac
}

####
# Docker Shell
# Start a bash shell in the given container
dksh() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dksh
Usage: dksh [container]

Begins a bash shell in the given docker container
HELP
return; fi

  if docker inspect "$1" > /dev/null 2>&1; then
    docker exec -it "$1" bash
  elif docker-compose ps "$1" > /dev/null 2>&1; then
    docker-compose exec "$1" bash
  else
    echo "No such container '$1' found"
  fi

}

####
# Docker Exec
# Runs a given program in a docker container
dkex() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dced
Usage: dkex [container] [options] [command]

Executes a command in the given docker container
HELP
return; fi

  if docker inspect "$1" > /dev/null 2>&1; then
    docker exec -it "$@"
  elif docker-compose ps "$1" > /dev/null 2>&1; then
    docker-compose exec "$@"
  else
    echo "No such container '$1' found"
  fi
}


###
# Docker file-system-inspect
# Shows what the filesystem looks like for the given container
dkfsi() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dkfsi
Usage: dkfsi [container]

Inspects the filesystem of the given container
HELP
return; fi

  local CONTAINER_ID=$1
  
  if [[ -z "$1" ]]; then
    CONTAINER_ID=$(docker ps -lq)
  fi

  docker export "${CONTAINER_ID}" | tar tf - 
}

###
# Docker file-system-export
# Exports the given container's filesystem
dkfse() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dkfse
Usage: dkfse [ image ]

Exports the filesystem of the given container
HELP
return; fi
  local CONTAINER_ID=$1
  local USERID=$(id -u)

  if [[ -z "$1" ]]; then
    CONTAINER_ID=$(docker ps -lq)
  fi

  mkdir -p "${CONTAINER_ID}" && docker export "${CONTAINER_ID}" | tar xf - --owner="${USERID}" --directory="${CONTAINER_ID}"
}

alias dkl="docker ps -lq"
alias dcu="docker-compose up"
