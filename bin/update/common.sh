#!/usr/bin/env bash

# powerline fonts
[[ -d $DOTFILES/lib/fonts/ ]] && pushd $DOTFILES/lib/fonts && git pull && popd

# vim
vim +PluginInstall +qall
