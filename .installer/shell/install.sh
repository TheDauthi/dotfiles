#/usr/bin/env bash

cd ~/.shellrc/

ln -s $(realpath dotfiles/bin) ~/.shellrc/bin

# init directories

declare -a paths

paths=("init" "init.d" "login.d" "platform.d" "shell.conf.d" "shellrc.d" )

for path in paths; do
  ln -s $(realpath "dotfiles/init/${path}") .
done

ln -s $(realpath files/bash/bash_profile)   $(realpath ~/.bash_profile)
ln -s $(realpath files/bash/bashrc)         $(realpath ~/.bashrc)
ln -s $(realpath files/zsh/zshrc)           $(realpath ~/.zshrc)
ln -s $(realpath files/vimrc/bash_profile)  $(realpath ~/.bash_profile)
ln -s $(realpath files/byobu/status)        $(realpath ~/.byobu/status)

    # ~/.byobu/keybindings.tmux:
    #   path: files/byobu/keybindings.tmux
    # ~/.shellrc/plugins/fasd:
    #   create: true
    #   path: files/plugins/fasd
