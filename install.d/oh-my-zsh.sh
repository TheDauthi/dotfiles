#!/usr/bin/env sh

if ! command -v zsh >/dev/null; then
  echo "zsh not found, please install zsh first"
  exit 1
fi

if [ ! -d ~/.shellrc/oh-my-zsh ]; then
  git clone -q https://github.com/robbyrussell/oh-my-zsh ~/.shellrc/oh-my-zsh
fi

if [ $SHELL != $(which zsh) ]; then
  echo "zsh is not the default shell. You should probably run 'chsh -s $(which zsh)' to change the default shell."
fi
