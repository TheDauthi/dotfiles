####
# Move up $1 directories
up()
{
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
up
Usage: up [ count ]

Moves up [count] directories
HELP
return; fi
    if [[ "$#" < 1 ]] ; then
        cd ..
    else
        local CDSTR=""
        for i in {1..$1} ; do
            CDSTR="../$CDSTR"
        done
        cd "$CDSTR"
    fi
}