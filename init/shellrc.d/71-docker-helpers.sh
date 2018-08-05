###
# Docker 'helpers'
docker-helper() {
  HELP=$(cat <<'HELP'
docker-helper
Usage: docker-helper [command]
Commands:
  volume         Work with docker volumes
HELP
)  
  if [[ "$1" == "-h" || "$1" == "--help" || "$1" == "" ]]; then 
    echo "${HELP}"
    return
  fi
  
  COMMANDNAME="$1"
  shift


  case "${COMMANDNAME}" in
    volume)
        _docker_helpers_volume "$@"
        ;;
    *)
        echo "${HELP}"
        return
  esac
}

_docker_helpers_volume() {
  HELP=$(cat <<'HELP'
docker-helper volume
Usage: docker-helper volume [command]

Commands:
  clone          Work with docker volumes
  
HELP
)
  if [[ "$1" == "-h" || "$1" == "--help" || "$1" == "" ]]; then 
    echo "${HELP}"
    return
  fi

  COMMANDNAME="$1"
  shift


  case "${COMMANDNAME}" in
    clone)
        _docker_helpers_volume_clone "$@"
        ;;
    *)
        echo "${HELP}"
        return
  esac

}

_docker_helpers_volume_clone() {
  HELP=$(cat <<'HELP'
docker-helper volume clone
Usage: docker-helper volume VOLUME1 VOLUME2

Clones VOLUME1 into VOLUME2
  
HELP
)
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then 
    echo "${HELP}"
    return
  fi
  
  if [ "$1" = "" ]; then
    echo "Please provide a source volume name"
    return
  fi

  if [ "$2" = "" ]; then
    echo "Please provide a destination volume name"
    return
  fi

  docker volume inspect $1 > /dev/null 2>&1
  if [ "$?" != "0" ]; then
    echo "The source volume '$1' does not exist"
    return
  fi
  
  #Now check if the destination volume name does not yet exist
  docker volume inspect $2 > /dev/null 2>&1
  if [ "$?" = "0" ]; then
    echo "The destination volume '$2' already exists"
    return
  fi

  echo "Creating destination volume '$2' ..."
  docker volume create --name "$2"
  echo "Copying data from source volume '$1' to destination volume '$2' ..."
  docker run --rm \
           -i \
           -t \
           -v $1:/from \
           -v $2:/to \
           alpine ash -c "cd /from ; cp -av . /to"
}

_docker-helper()
{
    local cur prev

    cur=${COMP_WORDS[COMP_CWORD]}
    prev=${COMP_WORDS[COMP_CWORD-1]}
    prevprev=${COMP_WORDS[COMP_CWORD-2]}

    case ${COMP_CWORD} in
        1)
            COMPREPLY=($(compgen -W "volume show" -- ${cur}))
            ;;
        2)
            case ${prev} in
                volume)
                    COMPREPLY=($(compgen -W "clone" -- ${cur}))
                    ;;
            esac
            ;;
        3)
            case ${prevprev} in
                volume)
                  case ${prev} in 
                    clone)
                      VOLUMES=$(docker volume ls --quiet | sed 's/\n/ /g')
                      COMPREPLY=($(compgen -W "$VOLUMES" -- ${cur}))
                    ;;
                  esac
                  ;;
            esac
            ;;
        *)
            COMPREPLY=()
            ;;
    esac
}

complete -F _docker-helper docker-helper