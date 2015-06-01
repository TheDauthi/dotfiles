is_osx || return 1

export CLICOLOR=1

BREWCOREUTILS="$(brew --prefix coreutils)/libexec"

pathprepend "$BREWCOREUTILS/gnubin"
PATH="/usr/local/bin:$PATH"

export MANPATH="$BREWCOREUTILS/gnuman:$MANPATH"

if [ -f /usr/local/share/bash-completion/bash_completion ]; then
  . /usr/local/share/bash-completion/bash_completion
fi

