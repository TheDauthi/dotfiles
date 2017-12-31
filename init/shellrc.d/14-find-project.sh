####
# Find project directory
pj()
{
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
pj
Usage: pj [ base ]

Finds the first path upwards that contains $base (default .git)
HELP
return; fi
  PT=$(pwd)
  while [[ "$PT" != "" && ! -e "$PT/.git" ]]; do
    PT=${PT%/*}
  done
  
  if [ "$PT" ]; then
    echo "$PT"
  else
    echo "."
  fi
}