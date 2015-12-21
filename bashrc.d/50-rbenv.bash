#!/bin/bash
# Sets up plenv in our environment
if [ -f $FILE ]; 
then
  pathprepend "$HOME/.rbenv/bin"
  eval "$(rbenv init -)"
fi
