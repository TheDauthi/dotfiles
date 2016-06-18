mysqldumpmultiple() {
  for I in $(mysql "$@" -e 'show databases' -s --skip-column-names); do mysqldump "$@" $I | gzip > "$I.sql.gz"; done
}
