####
# Creates a temp directory and moves object to it to get deleted on reboot
function tmpit() 
{
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
tmpit
Usage: tmpit file-or-directory

Moves parameter to tmp directory to be deleted on reboot
HELP
return; fi  
  mkdir -p /tmp/.trash && mv "$@" /tmp/.trash; 
}
