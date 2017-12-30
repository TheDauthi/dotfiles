#!/bin/sh

if type "zsh" > /dev/null; then
  if [ ! -d ~/.shellrc/oh-my-zsh ]; then
    git clone -q https://github.com/robbyrussell/oh-my-zsh ~/.shellrc/oh-my-zsh
  fi
fi

