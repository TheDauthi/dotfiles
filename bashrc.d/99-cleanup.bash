# Does some minor cleanup of our environment

PATH=`echo $PATH | tr ':' '\n' | sort | uniq | tr '\n' ':'`