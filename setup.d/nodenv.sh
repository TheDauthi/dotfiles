#!/usr/bin/env sh

git clone https://github.com/nodenv/nodenv.git ~/.nodenv
source ~/.shellrc/shellrc.d/*language-env.sh

git clone https://github.com/nodenv/nodenv-update.git "$(nodenv root)/plugins/nodenv-update"
git clone https://github.com/nodenv/nodenv-default-packages.git "$(nodenv root)/plugins/nodenv-default-packages"
git clone https://github.com/nodenv/node-build.git "$(nodenv root)/plugins/node-build"
git clone https://github.com/nodenv/nodenv-package-rehash.git "$(nodenv root)/plugins/nodenv-package-rehash"
git clone https://github.com/nodenv/nodenv-vars.git "$(nodenv root)/plugins/nodenv-vars"
exec $SHELL
