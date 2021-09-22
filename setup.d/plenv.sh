#!/usr/bin/env sh

language=nod
virtualenv_path="$HOME/.${language}env"
PATH="${virtualenv_path}/bin:$PATH"

git clone https://github.com/tokuhirom/plenv.git ~/.plenv
eval "$(${language}env init -)"

git clone https://github.com/tokuhirom/Perl-Build.git "$(plenv root)/plugins/perl-build/"
git clone https://github.com/hfm/plenv-update.git "$(plenv root)/plugins/plenv-update/"

exec "${SHELL}"
