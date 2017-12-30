alias dkc='docker-compose'

dk() {
  case "$1" in
    "e")
      shift
      dke "$@"
      ;;
    "fse")
      shift
      dkfse "$@"
      ;;
    "fsi")
      shift
      dkfsi "$@"
      ;;
    *)
      docker "$@"
    ;;
  esac
}

dksh() {
  docker exec -it $1 bash
}

dcsh() {
  docker-compose exec "$@" bash
}

dkex() {
  docker exec -it "$@"
}

dcex() {
  docker-compose exec "$@"
}

###
# Docker file-system-inspect
dkfsi() {
  local ID=$1
  
  if [[ -z "$1" ]]; then
    ID=$(docker ps -lq)
  fi

  docker export "$ID" | tar tf - 
}

###
# Docker file-system-export
dkfse() {
  local IMAGE=$1
  
  if [[ -z "$1" ]]; then
    IMAGE=$(docker ps -lq)
  fi

  mkdir -p "$IMAGE" && docker export "$IMAGE" | tar xf - --owner="$ID" --directory="$IMAGE"
}


alias dkl="docker ps -l -q"
