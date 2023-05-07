####
# Docker-Compose alias
# This alias also adds the additional commands defined below
# On no match, it will pass the commands off to docker-compose itself
dkc() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dkc
Usage: dkc [docker-compose-commands ...]

Shortcut for docker, adding new docker aliases as commands.
HELP
return; fi  
  case "$1" in
    "sh")
      shift
      dcsh "$@"
      ;;
    "ex")
      shift
      dcex "$@"
      ;;
    "fsi")
      shift
      dcfsi "$@"
      ;;
    "fse")
      shift
      dcfse "$@"
      ;;
    *)
      docker compose "$@"
    ;;
  esac
}

####
# Docker Shell
# Start a bash shell in the given container
dcsh() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dcsh
Usage: dcsh [service]

Begins a bash shell in the given docker-compose service
HELP
return; fi
  docker compose exec "$@" bash
}

####
# Docker Exec
# Runs a given program in a docker container
dcex() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dcex
Usage: dcex [service] [command]

Executes a command in the given docker-compose service
HELP
return; fi
  docker compose exec "$@"
}

###
# Docker-compose file-system-inspect
# Shows what the filesystem looks like for the given container
dcfsi() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dcfsi
Usage: dcfsi [service-name ...]

Inspects the filesystem of the named service(s)
HELP
return; fi
  
  local CONTAINERS=$(docker compose ps -q "$@")
  
  if [ "$?" -ne "0" ]; then
    return
  fi
  
  while read -r CONTAINER_ID; do
    docker export "${CONTAINER_ID}" | tar tf -     
  done <<< "${CONTAINERS}"
}

###
# Docker-compose file-system-export
# Exports the given container's filesystem
dcfse() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
dcfse
Usage: dkfse [service-name ...]

Exports the filesystem of the named service(s)
HELP
return; fi
  local -a SERVICES
  
  local USERID=$(id -u)

  local _RED='\033[0;31m'
  local _NC='\033[0m'

  if [ $# -eq 0 ]; then
    SERVICE_NAMES=$(docker compose config --services)
    while read -r SERVICE; do
      SERVICES=( "${SERVICES[@]}" "$SERVICE" )
    done <<< "${SERVICE_NAMES}"

    if [[ !${SERVICES[@]} ]]; then
      echo -e "${_RED}No services found${_NC}"
    fi
    return
  else
    SERVICES=( "$@" )
  fi

  for SERVICE_NAME in ${SERVICES[@]}; do
    CONTAINER_ID=$(docker compose ps -q "${SERVICE_NAME}")
    if [[ "$?" != "0" ]]; then
      continue
    fi
    mkdir -p "${SERVICE_NAME}"
    docker export "${CONTAINER_ID}" | tar xf - --owner="${USERID}" --directory="${SERVICE_NAME}"
  done
   
}

