# find-project
pj() {
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