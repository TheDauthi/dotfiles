if  type "ssh-pageant" > /dev/null; then
  eval $(/usr/bin/ssh-pageant -r -a "/tmp/.ssh-pageant-$USERNAME")
fi
