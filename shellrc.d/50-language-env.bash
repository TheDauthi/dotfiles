#!/bin/bash
# Sets up rbenv in our environment
languages=(rb pl py nod)

for language in $languages
do
  virtualenv_path="$HOME/.${language}env"
  if [ -d $virtualenv_path ];
  then
    pathprepend "$virtualenv_path/bin"
    eval "$(${language}env init -)"
  fi
done
