#!/bin/bash
# Sets up rbenv in our environment
local languages=(rb pl py)

for language in $languages; do
  local virtualenv_path="$HOME/.${language}env"
  if [ -d $virtualenv_path ]; then
    pathprepend "$virtualenv_path/bin"
    eval "$(${language}env init -)"
  fi
done
