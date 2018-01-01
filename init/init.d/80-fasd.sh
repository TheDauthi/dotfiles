if ! command -v fasd &> /dev/null; then
  if [ -e "$HOME/.shellrc/plugins/fasd/fasd" ]; then
    source ~/.shellrc/plugins/fasd/fasd
    alias j='fasd_cd -d'
  fi
fi
