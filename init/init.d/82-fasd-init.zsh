if command -v fasd &> /dev/null; then
  eval "$(fasd --init posix-alias zsh-hook)"
fi
