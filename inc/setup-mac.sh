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

header "Installing core and standart utilities..."
brew tap homebrew/versions
brew install bash
brew install bash-completion2
brew install coreutils # GNU core utilities (those that come with OS X are outdated)
brew install moreutils # Install some other useful utilities like `sponge`.
brew install findutils # GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
brew install gnu-sed --with-default-names # Install GNU `sed`, overwriting the built-in `sed`.
brew install tree
brew install readline
brew install rename
brew install curl
brew install wget --with-iri
brew install ag
brew install vim --override-system-vi
brew install midnight-commander
brew install ssh-copy-id
# more recent versions of some OS X tools
brew tap homebrew/dupes
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

echo

# git
header "Installing git..."
brew install git
brew install git-extras
brew install hub
brew install tig
# sudo bash < <( curl https://raw.githubusercontent.com/jamiew/git-friendly/master/install.sh)
echo

# nvm
header "Installing NVM..."
brew install nvm
mkdir "$HOME/.nvm"
export NVM_DIR="$HOME/.nvm"
source $(brew --prefix nvm)/nvm.sh
echo

# servers
header "Installing servers..."
brew install mariadb
brew install redis
brew install memcached
brew install httpd24
echo

# PHP
header "Installing PHP & Composer..."
brew tap homebrew/php
brew install php-version
brew install php56
brew install php56-mcrypt
brew install phplint
brew install composer

# sphinx 2.1.9
header "Installing Sphinx..."
brew uninstall sphinx
brew install https://gist.githubusercontent.com/podkot/12ca088400afbae4246a/raw/sphinx.rb --mysql
brew pin sphinx
echo

# other
header "Installing other software..."
brew install unrar
brew install ttfautohint fontforge --with-python
#brew install python
echo


header "OS X settings..."
source "$DOTFILES/inc/osx.sh"
echo
