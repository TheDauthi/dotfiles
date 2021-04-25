####
# Retreives IP address from Akamai. Uses IP in case of DNS failure
myip() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    cat <<HELP
myip
Usage: myip

Find your public IP address
HELP
    return
  fi
  local res=$(curl http://23.47.49.53/ --header 'Host: whatismyip.akamai.com' 2>/dev/null | grep -Eo '[0-9\.]+')
  echo -e "$res"
}
