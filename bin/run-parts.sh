#!/usr/bin/env bash
# A bash version of the debian run-parts program

set +e 

if [ $# -ne 1 ]; then 
  echo "Usage: run-parts.sh /path/to/run" 
  exit 1
fi 

if [ ! -d $1 ]; then 
  echo "$1 is not a directory, exiting" 
  exit 1
fi

for i in $1/* ; do 
  [ -d $i ] && continue 
  if [ -x $i ]; then 
  	$i
  fi
done

exit 0