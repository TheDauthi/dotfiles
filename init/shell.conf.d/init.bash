# _shell_init_extensions()
# {
#   local -a init_extensions=(bash sh)
#   local extension_regex
#   # Because this is slow on cygwin and join is single-char, 
#   # Do this with builtins... ugh.
 
#   for ((i=0; i<${#init_extensions[*]}; i++)); do
#     extension_regex+=".*\.${init_extensions[i]}"

#     if [ "$((i+1))" -lt "${#init_extensions[*]}" ]; then
#       extension_regex+="\|"
#     fi
#   done

#   echo $extension_regex
# }

_shell_init_extensions()
{
  echo 'bash sh'
}