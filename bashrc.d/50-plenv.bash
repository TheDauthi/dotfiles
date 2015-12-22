# Sets up plenv in our environment
if [ -d $HOME/.plenv ];
then
  pathprepend "$HOME/.plenv/bin"
  eval "$(plenv init -)"
fi
