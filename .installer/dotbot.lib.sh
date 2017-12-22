function _can_run_dotbot() {
  local _LINKED_PYTHON=_find_python

  if [[ ! -z "${_LINKED_PYTHON}" ]]; then
    return 0
  else
    return 1
  fi
}

# CONFIG="install.conf.yaml"

# DOTBOT_DIR=".installer/dotbot"
# DOTBOT_BIN="${DOTBOT_DIR}/bin/dotbot"

# BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# cd "${BASEDIR}"


function _install_via_dotbot() {
  local BASEDIR=$(realpath $1)
  shift

  cd "${BASEDIR}"

  local CONFIG="${BASEDIR}/install.conf.yaml"
  local DOTBOT_DIR="${BASEDIR}/.installer/dotbot"
  local DOTBOT_BIN="${DOTBOT_DIR}/bin/dotbot"

  if ! _has_git; then
    echo "Cannot use dotbot: git not found"
    return
  elif ! _has_python; then
    echo "Cannot use dotbot: python not found"
    return
  fi

  echo "installing via dotbot"

  git submodule update --init --recursive
  
  _LINKED_PYTHON=$(_find_python)
    
  "${_LINKED_PYTHON}" "${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"
}
