# Try to figure out the right clipboard and use it
case "$OSTYPE" in

linux*)
  # If you're on win32, forget all x-windows stuff.
  if uname -r | grep Microsoft >/dev/null; then
    ##### - We should just have the user to install win32yank
    CLIPBOARD_TYPE='WINDOWS'
    alias clip=$(PATH="$PATH:/mnt/c/Windows/System32" command -v clip.exe)
    return
  fi

  # You may have xsel or xclip installed. Choose the one that's there
  if command -v xsel >/dev/null 2>&1; then
    CLIPBOARD_TYPE='X'
    alias clip='xsel --clipboard --input'
    alias paste='xsel --clipboard --output'
  elif command -v xclip >/dev/null 2>&1; then
    alias clip='xclip -selection clipboard'
    alias paste='xclip -selection clipboard'
  fi

  alias pbcopy='clip'
  alias pbpaste='paste'
  ;;
esac
