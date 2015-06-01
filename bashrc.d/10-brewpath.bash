is_osx || return 1

COREPREFIX=$(brew --prefix coreutils)
BREWCOREUTILS="$COREPREFIX/libexec/gnubin"

pathprepend "$COREPREFIX/libexec/gnubin"

export MANPATH="$COREPREFIX/libexec/gnuman:$MANPATH"

if [ -f $(brew --prefix)/share/bash-completion/bash_completion ]; then
  . $(brew --prefix)/share/bash-completion/bash_completion
fi


#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  . $(brew --prefix)/etc/bash_completion
#fi
