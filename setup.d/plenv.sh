#!/usr/bin/env bash

language_name="Perl"
language_env="plenv"
virtualenv_root="$HOME/.plenv"
language_env_repo="https://github.com/tokuhirom/plenv.git"
plugins=(
    "perl-build=https://github.com/tokuhirom/Perl-Build.git"
    "plenv-update=https://github.com/hfm/plenv-update.git"
)
default_packages=()
default_package_file_name="default-packages"

PATH="$virtualenv_root/bin:$PATH"

get_latest_stable_version() {
    latest_stable_version=$($language_env install -l | grep -v '-' | awk -F. 'NR > 1 && $2 % 2 == 0' | head -n 1 | sed 's/^ //')
}

###############################################################################
####################### NO USER-SERVICEABLE PARTS BELOW #######################
###############################################################################

install_language_env() {
  if [ -d "$HOME/.${language_env}" ]; then
    echo "Updating $language_env..."
    cd "$HOME/.${language_env}" && git pull
  else
    echo "Installing $language_env..."
    git clone "$language_env_repo" "$HOME/.${language_env}"
  fi
}

# A little ugly, since we want to keep bash 3.2 compatibility
install_plugins() {
  echo "Installing plugins..."
  # Clone or pull plugins as needed
  for plugin in "${plugins[@]}"; do
    IFS="=" read -ra parts <<< "$plugin"
    plugin_name="${parts[0]}"
    plugin_url="${parts[1]}"
    plugin_path="$virtualenv_root/plugins/$plugin_name"
    if [ ! -d "$plugin_path" ]; then
      echo "Installing $plugin_name..."
      git clone "$plugin_url" "$plugin_path"
    else
      echo "Updating $plugin_name..."
      pull_output=$(git -C "$plugin_path" pull)
      if [ "$pull_output" == "Already up to date." ]; then
        echo "$plugin_name is already up to date."
      else
        echo "$plugin_name has been updated."
      fi
    fi
  done
}

prompt_installation() {
  # If -y flag was passed, proceed with the installation
  if $yes_flag; then
    proceed_with_installation=true
    return
  fi

  if $language_env versions | grep -q "$latest_stable_version"; then
    echo -e "\e[32m$latest_stable_version is already installed, skipping installation.\e[0m"
    proceed_with_installation=false
    return
  fi


  read -r -d '' prompt <<-EOM
	You've installed $language_env. We now suggest switching from any system-provided $language_name.
	The latest stable version is $latest_stable_version.
	Do you want to proceed? (y/n) 
EOM

  echo -n "$prompt "
  read response

  # If the response is 'y' or 'Y', set proceed_with_installation to true
  if [[ "$response" == "y" || "$response" == "Y" ]]; then
    proceed_with_installation=true
  else
    proceed_with_installation=false
  fi
}
  
additional_setup() {
  echo "Setting up default packages..."
  default_package_file="$virtualenv_root/$default_package_file_name"
  for package in "${default_packages[@]}"; do
    if [ ! -f "$default_package_file" ] || ! grep -q "^$package$" "$default_package_file"; then
      echo "Adding $package..."
      echo "$package" >> "$default_package_file"
    fi
  done
}

# Default values for flags
yes_flag=false
quiet_flag=false

# Parse command line options
while getopts "yq" opt; do
  case $opt in
    y) yes_flag=true ;;
    q) quiet_flag=true ;;
  esac
done

install_language_env
install_plugins
additional_setup

# If -q flag was passed, do not proceed
if $quiet_flag; then
    proceed_with_installation=false
else
    get_latest_stable_version
    prompt_installation
fi

if $proceed_with_installation; then
  eval "$($language_env init -)"

  install_output=$($language_env install "$latest_stable_version" 2>&1)
  install_exit_code=$?

  if [ $install_exit_code -eq 0 ] || [[ "$install_output" == *"already installed"* ]]; then
    $language_env global "$latest_stable_version"
    echo -e "\e[32mSuccessfully installed and set $latest_stable_version as the global version for $language_name.\e[0m"
  else
    echo "Error message: $install_output"
    echo -e "\e[31mInstallation of $latest_stable_version failed. Please check the logs for more details.\e[0m"
  fi
fi

exec "${SHELL}"