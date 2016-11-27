#!/usr/bin/env bash

# DOTFILES="$HOME/dotfiles"
# source "$DOTFILES/tilde/bashrc"

# os x
header "Updating macOS"
# sudo -v
sudo softwareupdate -i -a
xcode-select --install
echo

# homebrew
header "Updating Homebrew"
# sudo -v
brew update
brew upgrade --all
brew cleanup
brew cask cleanup
brew cask list | xargs brew cask install #--force
brew prune
echo
