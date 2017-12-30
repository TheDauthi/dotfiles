#!/usr/bin/env bash

relPath () {
    local common path up
    common=${1%/} path=${2%/}/
    while test "${path#"$common"/}" = "$path"; do
        common=${common%/*} up=../$up
    done
    path=$up${path#"$common"/}; path=${path%/}; printf %s "${path:-.}"
}

# Return relative path from dir $1 to dir $2 (Does not impose any
# restrictions on $1 and $2 but requires GNU Core Utility "readlink"
# HINT: busybox's "readlink" does not support option '-m', only '-f'
#       which requires that all but the last path component must exist)
relpath () { relPath "$(readlink -m "$1")" "$(readlink -m "$2")"; }

real_to_abspath() {
  # both $1 and $2 are absolute paths beginning with /
  # returns relative path to $2/$target from $1/$source
  source=$1
  target=$2

  common_part=$source # for now
  result="" # for now

  while [[ "${target#$common_part}" == "${target}" ]]; do
      # no match, means that candidate common part is not correct
      # go up one level (reduce common part)
      common_part="$(dirname $common_part)"
      # and record that we went back, with correct / handling
      if [[ -z $result ]]; then
          result=".."
      else
          result="../$result"
      fi
  done

  if [[ $common_part == "/" ]]; then
      # special case for root (no common path)
      result="$result/"
  fi

  # since we now have identified the common part,
  # compute the non-common part
  forward_part="${target#$common_part}"

  # and now stick all parts together
  if [[ -n $result ]] && [[ -n $forward_part ]]; then
      result="$result$forward_part"
  elif [[ -n $forward_part ]]; then
      # extra slash removal
      result="${forward_part:1}"
  fi

  echo $result
}
