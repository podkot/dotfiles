#!/usr/bin/env bash

# DOTFILES="$HOME/dotfiles"
# source "$DOTFILES/tilde/bashrc"

# homebrew
header "Installing and updating Homebrew..."
command_exists brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade --all
brew doctor
echo

# sphinx 2.1.9
header "Installing Sphinx 2.1.9..."
brew uninstall sphinx
brew install https://gist.githubusercontent.com/podkot/12ca088400afbae4246a/raw/sphinx.rb --mysql
brew pin sphinx
echo


header "Installing brew formulae..."
brew bundle --global
echo

header "OS X settings..."
source "$DOTFILES/inc/osx.sh"
echo

header "Seil settings..."
source "$DOTFILES/inc/setup/seil.sh"
echo

header "Spectacle settings..."
source "$DOTFILES/inc/setup/spectacle.sh"
echo

header "iTerm2 settings..."
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder 1
defaults write com.googlecode.iterm2 PrefsCustomFolder "~/dotfiles/etc/iterm2"
echo
