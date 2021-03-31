#!/usr/bin/env sh

git clone https://github.com/pyenv/pyenv.git ~/.pyenv
source ~/.shellrc/shellrc.d/*language-env.sh

git clone git://github.com/pyenv/pyenv-update.git "$(pyenv root)/plugins/pyenv-update"
git clone https://github.com/jawshooah/pyenv-default-packages.git "$(pyenv root)/plugins/pyenv-default-packages)"
echo "pip" >>"$(rbenv root)/default-packages"

exec "${SHELL}"
