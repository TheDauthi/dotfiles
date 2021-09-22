# Sets up language-envs in our environment

_env_languages=(rb pl py nod php)

_load_language_path()
{
    local language=$1
    local virtualenv_path="$HOME/.${language}env"
    if [ -d $virtualenv_path ]; then
      pathprepend "$virtualenv_path/bin"
      if [ "$language" = "py" ]; then
        # pyenv has started required a new flag to fully initialize. Thanks, pyenv
        eval "$(${language}env init --path)"
      else
        eval "$(${language}env init -)"
      fi
    fi
}

for language in "${_env_languages[@]}"; do 
  _load_language_path $language
done
