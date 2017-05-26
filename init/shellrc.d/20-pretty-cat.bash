
if $(command -v pygmentize &> /dev/null) ; then
  # get the full paths to binaries
  LESS_BIN=$(which less)

  function less()
  {
      pygmentize -g $* | "$LESS_BIN" -R
  }
fi
