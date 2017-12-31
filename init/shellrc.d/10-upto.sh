####
# upto: Find parents
upto()
{
  if [[ "$1" == "-h" || "$1" == "--help" || -z "$1" ]]; then cat <<HELP
upto
Usage: upto [ parent ]

Change to parent directory named parent. Provides shell completion.
HELP
return; fi
    local upto=$1
    cd "${PWD/\/$upto\/*//$upto}"
}
