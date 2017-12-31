mysqldumpall() {
  if [[ "$1" == "-h" || "$1" == "--help" ]]; then cat <<HELP
mysqldumpall
Usage: mysqldumpall [ mysql-dump-options ]

Creates dumps of mysql into separate partitioned by schema.
HELP
return; fi
  # To make sure all of them have the same start time
  local starttime=$(date "+%Y-%m-%dT%H:%M:%S")
  
  for db in $(mysql "$@" -e 'show databases' -s --skip-column-names); do
    mysqldump "$@" $db | gzip > "${db}.${starttime}.sql.gz"; 
  done
}
