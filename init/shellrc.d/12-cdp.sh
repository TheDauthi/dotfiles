####
# Find parent project directory
cdp()
{
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
cdp
Usage: cdp [ base ]

Change to parent directory containing [ base ] (default .git)
HELP
return; fi
  local CDPBASE=${1:-.git}
  local PT=$(pwd)
  while [[ "$PT" != "" && ! -e "$PT/$CDPBASE" ]]; do
    PT=${PT%/*}
  done
  
  if [ "$PT" ]; then
    cd "$PT"
  fi
}