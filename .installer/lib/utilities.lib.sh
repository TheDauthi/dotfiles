abspath() {
  if [[ -d "$1" ]]
  then
    pushd "$1" >/dev/null
    pwd
    popd >/dev/null
  elif [[ -e $1 ]]
  then
    pushd "$(dirname "$1")" >/dev/null
    echo "$(pwd)/$(basename "$1")"
    popd >/dev/null
  else
    echo "$1" does not exist! >&2
    return 127
  fi
}

command_exists () {
    type "$1" &> /dev/null ;
}

_has_git() {
  command -v git &> /dev/null
}

setup_gitconfig () {
  if ! [[ -f git/gitconfig.local.symlink ]]
  then
    info 'setup gitconfig'

    git_credential='cache'
    if [ "$(uname -s)" == "Darwin" ]
    then
      git_credential='osxkeychain'
    fi

    user ' - What is your github author name?'
    read -e git_authorname
    user ' - What is your github author email?'
    read -e git_authoremail

    sed -e "s/AUTHORNAME/$git_authorname/g" -e "s/AUTHOREMAIL/$git_authoremail/g" -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" git/gitconfig.local.symlink.example > git/gitconfig.local.symlink

    success 'gitconfig'
  fi
}