# Sets up rbenv in our environment

_env_languages=(rb pl py nod)

_load_language_path()
{
    local language=$1
    local virtualenv_path="$HOME/.${language}env"
    if [ -d $virtualenv_path ]; then
      pathprepend "$virtualenv_path/bin"
      eval "$(${language}env init -)"
    fi
}

for language in $_env_languages; do
  _load_language_path $language
done
