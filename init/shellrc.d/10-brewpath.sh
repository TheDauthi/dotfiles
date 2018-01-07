is_osx || return 1

COREPREFIX="$(brew --prefix coreutils)"
BREWCOREUTILS="$COREPREFIX/libexec/gnubin"

pathprepend "$COREPREFIX/libexec/gnubin"

export MANPATH="$COREPREFIX/libexec/gnuman:$MANPATH"
