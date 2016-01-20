
if $(command -v pygmentize &> /dev/null) ; then
  # get the full paths to binaries
  CAT_BIN=$(which cat)
  LESS_BIN=$(which less)

  # pigmentize cat and less outputs
  function cat()
  {
      for var;
      do
          pygmentize "$var" 2>/dev/null || "$CAT_BIN" "$var";
      done
  }

  function less()
  {
      pygmentize -g $* | "$LESS_BIN" -R
  }
fi