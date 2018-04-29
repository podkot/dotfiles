#!/usr/bin/env bash

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
brew upgrade
brew cleanup
brew cask cleanup
brew cask list | xargs brew cask install #--force
brew prune

# https://github.com/Homebrew/brew/issues/2356
brew reinstall vim
echo

# subl command
command_exists subl || ln -s '/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl' "$DOTFILES/bin/subl"
