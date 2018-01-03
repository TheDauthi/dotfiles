source "$(cd "$(dirname "$0")" && cd ../ && pwd)/libs"

if is_debian; then 
  sudo apt-get install urlview
fi