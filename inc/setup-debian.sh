#!/usr/bin/env bash

# DOTFILES="$HOME/dotfiles"
# source "$DOTFILES/tilde/bashrc"


sudo apt-get install git
sudo apt-get install tig
sudo apt-get install mc
sudo apt-get install vim

# debian >= 8, ubuntu >= 13.10
sudo apt-get install silversearcher-ag

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
