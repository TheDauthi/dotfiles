#!/usr/bin/env sh

git clone https://github.com/tokuhirom/plenv.git ~/.plenv
source ~/.shellrc/shellrc.d/*language-env.sh

git clone https://github.com/tokuhirom/Perl-Build.git "$(plenv root)/plugins/perl-build/"
git clone https://github.com/hfm/plenv-update.git "$(plenv root)/plugins/plenv-update/"

exec "${SHELL}"
