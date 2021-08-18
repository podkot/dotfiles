#!/usr/bin/env bash

# powerline fonts
if [[ ! -d $DOTFILES/lib/fonts/ ]]; then
    git clone https://github.com/powerline/fonts $DOTFILES/lib/fonts
fi
header "Installing powerline fonts"
$DOTFILES/lib/fonts/install.sh
echo

