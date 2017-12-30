#!/usr/bin/env bash

_emulate_git_subrepo() {
  local _module_file="$1"

  declare -a _submodule_config

  readarray _submodule_config < "${_module_file}" # Include newline.
    
  let i=0
  
  local _clone_path=''
  local _repository=''

  while (( ${#_submodule_config[@]} > i )); do
    LINE="$( echo ${_submodule_config[i]} | tr -d '[:space:]')"
    
    if [[ "${LINE}" == [submodule* ]]; then
      [[ ! -z "${_clone_path}" && ! -z "${_repository}" ]] || continue
      _emulate_git_clone $_repository $_clone_path

      _clone_path=''
      _repository=''
    fi

    if [[ "${LINE}" =~ "path" ]]; then
      _clone_path=$(echo "${LINE}" | cut -d'=' -f2)
    elif [[ "${LINE}" =~ "url" ]]; then
      _repository=$(echo "${LINE}" | cut -d'=' -f2)
    fi
    
    (( ++i ))
  done

  _emulate_git_clone $_repository $_clone_path

}

_emulate_git_clone() {
  local _repository=$1
  local _clone_path=$2
  local _force=$3
  
  # Repository name must exist, or someone forgot to check their inputs
  [[ ! -z "${_repository}" ]] || return 1
  
  # Repository should not have the .git extension
  _repository=$(echo $_repository | sed -e 's/.git$//')

  # Git will automatically fill the clone directory based on the repo name
  if [[ -z "${_clone_path}" ]]; then
    _clone_path=$(basename ${_repository} .git | cut -f1 -d_)
  fi

  mkdir -p "${_clone_path}"
  
  # Git will fail if the directory exists, is not empty, and force isn't specified
  if [[ ! -z "$(ls -A ${_clone_path})" && -z ${_force} ]]; then
    echo "would skip clone of ${_repository} into ${_clone_path}: path is not empty"
    return 1
  fi
 
  curl -L --output - "${_repository}/archive/master.tar.gz" | tar -C "${_clone_path}" --strip-components 1 -xzf -
}