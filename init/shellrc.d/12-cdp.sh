cdp () 
{
  PT=$(pwd)
  while [[ "$PT" != "" && ! -e "$PT/.git" ]]; do
    PT=${PT%/*}
  done
  
  if [ "$PT" ]; then
    cd "$PT"
  fi
}
