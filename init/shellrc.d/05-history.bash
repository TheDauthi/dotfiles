# Don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

HISTCONTROL="erasedups:ignoreboth"
# This will save the history after each command
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
