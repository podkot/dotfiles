#!/usr/bin/env bash

# DOTFILES="$HOME/dotfiles"
# source "$DOTFILES/tilde/bashrc"

# os x
header "Updating OS X..."
# sudo -v
sudo softwareupdate -i -a
echo

# homebrew
header "Updating Homebrew..."
# sudo -v
brew update
brew upgrade --all
brew cleanup
brew cask cleanup
brew prune
echo
