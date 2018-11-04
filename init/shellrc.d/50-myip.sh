####
# Retreives IP address from Akamai. Uses IP in case of DNS failure
function myip()
{
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
myip
Usage: myip

Find your public IP address
HELP
return; fi  
  local res=$(curl http://104.104.244.226/ --header 'Host: whatismyip.akamai.com' 2>/dev/null | grep -Eo '[0-9\.]+')
  echo -e "$res"
}