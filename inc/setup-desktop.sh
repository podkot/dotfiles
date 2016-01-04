#!/usr/bin/env bash

# DOTFILES="$HOME/dotfiles"
# source "$DOTFILES/tilde/bashrc"

# powerline fonts
if [[ ! -d $DOTFILES/lib/fonts/ ]]; then
    git clone https://github.com/powerline/fonts $DOTFILES/lib/fonts
fi
header "Installing powerline fonts..."
$DOTFILES/lib/fonts/install.sh
echo


# perlbrew
if command_exists perlbrew ; then
    echo "Perlbrew already installed"
else
    header "Installing perlbrew..."
    \curl -L http://install.perlbrew.pl | bash
    perlbrew install perl-5.16.3
    cat $DOTFILES/data/perlbrew.txt | cpanm
fi

# nvm
if command_exists nvm ; then
    header "Installing node..."
    nvm install stable
    nvm use stable
    nvm alias default stable
fi

# npm
if command_exists npm ; then
    header "Installing npm packages..."
    npm config set loglevel warn
    npm config set save-prefix ''
    npm install -g npm
    npm install -g grunt-cli
    # npm install -g yo
    npm install -g jshint
    npm install -g jscs
    npm install -g bower
    # npm install -g docpad
    npm install -g npm-check-updates
    npm install -g node-inspector
    npm install -g iron-node
    npm install -g karma-cli
    npm install -g github-release-from-changelog
    npm install -g flow-bin
fi

# pip
if command_exists pip ; then
    pip install -U codeintel
    pip install -U licen
fi

# rvm
if command_exists rvm ; then
    echo "RVM already installed"
else
    header "Installing RVM..."
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    echo "gem: --no-document" >> ~/.gemrc
    \curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=gem,bundler
fi
