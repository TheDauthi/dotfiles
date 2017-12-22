function _find_python() {
  local _LINKED_PYTHON=$(command -v python python2 python2.6 python2.7 python3 | head -n 1)
  
  if [[ ! -z "${_LINKED_PYTHON}" ]]; then
    echo "${_LINKED_PYTHON}"
    return 0
  fi

  _LINKED_PYTHON=command -v $(compgen -c | grep 'python' | head -n1)
  
  if [[ ! -z "${_LINKED_PYTHON}" ]]; then
    echo "${_LINKED_PYTHON}"
    return 0  
  fi

  return 1
}

function  _has_python() {
  [[ ! -z "$(_find_python)" ]]
}