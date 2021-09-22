#!/usr/bin/env sh

language=py
virtualenv_path="$HOME/.${language}env"
PATH="${virtualenv_path}/bin:$PATH"

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
eval "$(${language}env init -)"

git clone git://github.com/pyenv/pyenv-update.git "$(pyenv root)/plugins/pyenv-update"
git clone https://github.com/jawshooah/pyenv-default-packages.git "$(pyenv root)/plugins/pyenv-default-packages)"
echo "pip" >>"$(rbenv root)/default-packages"

exec "${SHELL}"
