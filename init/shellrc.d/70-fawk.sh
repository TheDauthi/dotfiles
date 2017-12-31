####
# Extract column $1 from STDIN
function fawk()
{
  local USAGE="\
fawk

usage:  fawk [<awk_args>] <field_no>
        
Extracts a requested field number        

Ex: getent passwd | grep root | fawk -F: 5
"
  if [ $# -eq 0 ]; then
    echo -e "$USAGE" >&2
    return
  fi


  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    echo -e "$USAGE" >&2
    return
  fi

  local last=${@:(-1)}

  if ! [ $last -eq $last ] &>/dev/null; then
    echo "Last argument (field number) must be numeric." >&2
    echo -e "$USAGE" >&2;
    return
  fi

  if [ $# -gt 1 ]; then
    local rest=${@:1:$(( $# - 1 ))}
  else
    local rest=''
  fi
  awk $rest "{ print  \$$last }"
}
