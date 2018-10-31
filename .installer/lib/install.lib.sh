link_file() {
  local src=$1 
  local dst=$2
  
  _link_file $src $dst

  action="$?"

  # The only case we -actually- skip is "skip"
  if [[ "$action" -eq 1 ]]; then
    success "Skipping $src to $dst"
    return 0;
  fi
  
  if [[ "$action" -eq 2 ]]; then
    mv "$src" "$src.$(date --utc +%FT%TZ)"
    success "Backed up $src"
  elif [[ "$action" -eq 3 ]]; then
    unlink_or_remove "$dst"
    success "removed $dst"
  fi

  ln -s "$src" "$dst"
  return 0;
}

# Some non-GNU systems insist that deleting the contents of
# a directory symlink is correct. That's not POSIX-compliant
unlink_or_remove() {
  local destination=$1
  if [ -L "$destination" ]; then
    unlink "$destination"
  else
    rm -rf "$destination"
  fi  
}

_link_file() {
  local src=$1 dst=$2
  local currentSrc="$(readlink $dst)"

  local _link=0 _skip=1 _backup=2 _overwrite=3

  if [[ ! -f "$dst" ]] && [[ ! -d "$dst" ]] && [[ ! -L "$dst" ]]; then
    return $_link;
  fi

  if [ "$currentSrc" == "$src" ]; then
    return $_skip;
  fi

  if [[ "$overwrite_all" == "true" ]]; then
    return $_overwrite
  fi

  if [[ "$backup_all" == "true" ]]; then
    return $_backup
  fi

  if [[ "$skip_all" == "true" ]]; then
    return $_skip
  fi

  local action=

  user "File already exists: $dst ($(basename "$src")), what do you want to do?\n\
  [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all?"

  read -n 1 action

  case "$action" in
    o )
      return $_overwrite
      ;;
    O )
      overwrite_all="true";
      return $_overwrite
      ;;
    b )
      return $_backup
      ;;
    B )
      backup_all="true"
      return $_backup
      ;;
    s )
      return $_skip
      ;;
    S )
      skip_all="true"
      return $_skip
      ;;
    * )
      ;;
  esac
  return $_skip
}

