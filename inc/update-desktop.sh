#!/usr/bin/env bash

# DOTFILES="$HOME/dotfiles"
# source "$DOTFILES/tilde/bashrc"

# perlbrew reinstall:
# perlbrew list-modules | perlbrew exec --with perl-5.20.0@foo-project cpanm

# if command_exists cpan-outdated; then
#     # you will need to repeat this for every Perl you have installed under it
#     cpan-outdated -p | cpanm
# fi

# pip
if command_exists pip ; then
    pip install -U codeintel
    pip install -U licen
    pip install -U thefuck
fi

# nvm
if command_exists nvm ; then
    header "Installing/updating node..."
    nvm install stable
    nvm use stable
    nvm alias default stable
fi

# npm
if command_exists npm ; then
    header "Installing/updating npm packages..."
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
# if command_exists npm; then
#     header "Updating NPM..."
#     npm update npm -g
#     npm update -g
#     echo
# fi

# rvm
if command_exists rvm; then
    header "Updating RVM..."
    rvm get head
    rvm reload
    rvm get stable
    echo

    # gems
    if command_exists gem; then
        header "Updating Ruby gems..."
        # sudo -v
        gem update
        echo
    fi
fi


