#!/usr/bin/env bash

# powerline fonts
if [[ -d "$DOTFILES/lib/fonts/" ]]; then
    pushd "$DOTFILES/lib/fonts"
        git pull
    popd
fi

# vim
vim +PluginInstall +qall

# .bashrc_vars
if [[ ! -f ~/.bashrc_vars ]]; then
    cp "$DOTFILES/bashrc_local_example.bash" ~/.bashrc_vars
fi

# marker
if [[ -d "$DOTFILES/lib/marker/" ]]; then
    pushd "$DOTFILES/lib/marker"
        git pull
    popd
fi
