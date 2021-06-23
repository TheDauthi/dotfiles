# If we're on OSX, we should use the brew coreutils if possible

if ! is_osx; then
    return 1
fi

export CLICOLOR=1

BREWCOREUTILS="$(brew --prefix coreutils)/libexec"

pathprepend "$BREWCOREUTILS/gnubin"

pathprepend "/usr/local/bin"

export MANPATH="$BREWCOREUTILS/gnuman:$MANPATH"
