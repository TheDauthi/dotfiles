###
# Detect platform
_detect_platform() {
  _PLATFORM='unknown'
  _RELEASE='unknown'
  
  local _uname=$(uname  | tr '[A-Z]' '[a-z]')

  if [[ "${_uname}" =~ 'linux' ]]; then
    _PLATFORM='linux'
  elif [[ "${_uname}" =~ '^darwin' ]]; then
    _PLATFORM='darwin'
  elif [[ "${_uname}" =~ 'bsd' ]]; then
    _PLATFORM='bsd'
  elif [[ "${_uname}" =~ 'cygwin' ]]; then
    _PLATFORM='cygwin'
  fi

  if [[ -f /etc/debian_version ]]; then
    _RELEASE='debian'
  elif [[ "${_uname}" =~ 'freebsd' ]]; then
    _RELEASE='freebsd'
  fi
}

# Environment detection functions
is_osx() {
  [[ "${_PLATFORM}" =~ "darwin" ]] || return 1
}

is_debian() {
  [[ "${_RELEASE}" =~ 'debian' ]] || return 1
}

is_cygwin() {
  [[ "${_PLATFORM}" =~ "cygwin" ]] || return 1
}

is_bsd() {
  [[ "${_PLATFORM}" =~ "bsd" ]] || return 1
}

is_linux() {
  [[ "${_PLATFORM}" =~ "linux" ]] || return 1
}

is_zsh() {
  local RUNNING_SHELL="$(_detect_shell)"
  [[ "${RUNNING_SHELL}" == "zsh" ]] || return 1
}

is_bash() {
  local RUNNING_SHELL="$(_detect_shell)"
  [[ "${RUNNING_SHELL}" == "bash" ]] || return 1;
}

_detect_platform