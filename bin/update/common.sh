#!/usr/bin/env bash

# powerline fonts
[[ -d $DOTFILES/lib/fonts/ ]] && pushd $DOTFILES/lib/fonts && git pull && popd

# bash-it
[[ -d $DOTFILES/lib/bash-it/ ]] && pushd $DOTFILES/lib/bash-it && git pull && popd

# bash-it plugins
if command_exists bash-it ; then
    bash-it disable plugin all
    bash-it enable plugin alias-completion
    bash-it enable plugin base
    bash-it enable plugin fzf
fi

# vim
vim +PluginInstall +qall
