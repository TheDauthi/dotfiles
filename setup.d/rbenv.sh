#!/usr/bin/env sh

language=rb
virtualenv_path="$HOME/.${language}env"
PATH="${virtualenv_path}/bin:$PATH"

git clone https://github.com/rbenv/rbenv.git ~/.rbenv
eval "$(${language}env init -)"

mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)/plugins/ruby-build"
git clone https://github.com/rbenv/rbenv-vars.git "$(rbenv root)/plugins/rbenv-vars"
git clone https://github.com/rbenv/rbenv-default-gems.git "$(rbenv root)/plugins/rbenv-default-gems"
git clone https://github.com/rkh/rbenv-update.git "$(rbenv root)/plugins/rbenv-update"

echo "bundler" >>"$(rbenv root)/default-gems"
echo "pry" >>"$(rbenv root)/default-gems"
echo "byebug" >>"$(rbenv root)/default-gems"

exec "${SHELL}"
