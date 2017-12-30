####
# Creates a backup file 
function buf()
{
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
buf
Usage: buf [<from>] [<to>]

Creates a timestamped backup of <from> into <to>, with "." being the default.

If there is an active sudo ticket, read files with sudo rights.
HELP
return; fi
  local backup="$1"
  local outpath="$2"

  if [ -z "$backup" ]; then
    backup="."
  fi

  # We need the absolute location to make a good filename
  local abs_backup="$(abspath "$backup")"
  if [ -z "$outpath" ]; then
    outpath="."
  fi

  local base_filename="$(basename $abs_backup)"

  local filetime=$(date +%Y%m%d_%H%M%S)
  
  local filename="${base_filename}_${filetime}.tgz"

  local abs_parent_path="$(dirname ${abs_backup})"
  local output_filename="${outpath}/${filename}"

  sudo -nv >/dev/null 2>&1

  if [ "$?" = "0" ]; then
    local current_user=$(id -nu)
    local current_group=$(id -ng)
    # The tar may take a long, long time, so sudo the entire command
    sudo sh <<BACKUP
      tar -czf "${output_filename}" -C "${abs_parent_path}" --exclude "**/${filename}" \
        --ignore-failed-read "${base_filename}"
      chown "$current_user:$current_group" "${output_filename}"
BACKUP
  else
    tar -czf "${output_filename}" -C "${abs_parent_path}" --exclude "**/${filename}" \
      --ignore-failed-read "${base_filename}"
  fi
}

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
