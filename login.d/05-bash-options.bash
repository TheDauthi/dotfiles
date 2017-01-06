# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

#if $(shopt -p | grep "globstar"); then
#  # If set, the pattern "**" used in a pathname expansion context will
#  # match all files and zero or more directories and subdirectories.
#  shopt -s -q globstar 2>&1 > /dev/null
#fi
