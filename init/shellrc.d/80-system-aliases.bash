# prettify mount output by default
mount ()
{
  if [ "$#" -eq 0 ]; then
    command mount | column -t
  else
    command mount "$@"
  fi
}
