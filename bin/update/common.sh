#!/usr/bin/env bash

# powerline fonts
[[ -d $DOTFILES/lib/fonts/ ]] && pushd $DOTFILES/lib/fonts && git pull && popd

# vim
vim +PluginInstall +qall

# .bashrc_vars
[[ ! -f ~/.bashrc_vars ]] && cp $DOTFILES/bashrc_local_example.bash ~/.bashrc_vars
