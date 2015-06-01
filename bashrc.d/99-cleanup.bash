# Does some minor cleanup of our environment

PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++{if (NR > 1) printf ORS; printf $a[$1]}')
# PATH=`echo $PATH | tr ':' '\n' | sort | uniq | tr '\n' ':'`
