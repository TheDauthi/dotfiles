is_osx || return 1

export CLICOLOR=1

BREWCOREUTILS="$(brew --prefix coreutils)/libexec"

pathprepend "$BREWCOREUTILS/gnubin"
pathprepend "/usr/local/bin"

export MANPATH="$BREWCOREUTILS/gnuman:$MANPATH"

