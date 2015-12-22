# Sets up plenv in our environment
if [ -d $HOME/.pyenv ];
then
  pathprepend "$HOME/.pyenv/bin"
  eval "$(pyenv init -)"
fi
