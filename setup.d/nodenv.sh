#!/usr/bin/env bash

language=nod
virtualenv_path="$HOME/.${language}env"
PATH="${virtualenv_path}/bin:$PATH"

git clone https://github.com/nodenv/nodenv.git ~/.nodenv
eval "$(${language}env init -)"

git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)/plugins/nodenv-update"
git clone https://github.com/nodenv/nodenv-default-packages.git "$(nodenv root)/plugins/nodenv-default-packages"
git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"
git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)/plugins/nodenv-package-rehash"
git clone https://github.com/nodenv/nodenv-vars.git "$(nodenv root)/plugins/nodenv-vars"
exec $SHELL
