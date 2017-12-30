install_or_warn() {
  FROM=$1
  TO=$2
  if [[ -e "${TO}" ]]; then
    echo "Skipping installed ${TO}"
  else
    ln -s "${FROM}" "${TO}"
  fi
}
