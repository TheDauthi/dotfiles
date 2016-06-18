case $OSTYPE in
  linux*)
    XCLIP=$(command -v xclip)
    [[ $XCLIP ]] && alias pbcopy="$XCLIP -selection clipboard" && alias pbpaste="$XCLIP -selection clipboard -o"
    ;;   
esac