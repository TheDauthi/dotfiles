#!/bin/bash
# Sets up rbenv in our environment

if [ -d "$HOME/.rbenv" ];
then
  pathprepend "$HOME/.rbenv/bin"
  eval "$(rbenv init -)"
fi
