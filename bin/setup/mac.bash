#!/usr/bin/env bash

# homebrew
header "Installing and updating Homebrew"
command_exists brew || ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew update
brew upgrade --all
brew doctor
echo

# sphinx 2.1.9
header "Installing Sphinx 2.1.9"
brew uninstall sphinx
brew install https://gist.githubusercontent.com/podkot/12ca088400afbae4246a/raw/sphinx.rb --mysql
brew pin sphinx
echo


header "Installing brew formulae"
brew bundle --global
echo

# bash 4
grep /usr/local/bin/bash /etc/shells || echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
sudo chsh -s /usr/local/bin/bash

