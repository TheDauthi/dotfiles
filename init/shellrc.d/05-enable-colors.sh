if [ ! -z "`type dircolors`" ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
	
	if ls --help 2>&1 | grep -q -- --color
	then
    	alias ls='ls --color=auto -F'
	else
    	alias ls='ls -FG'
	fi

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

export CLICOLOR=1
