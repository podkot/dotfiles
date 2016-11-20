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
    pip install -U pip
    pip install -U licen
    # pip install -U thefuck
fi

if command_exists pip3 ; then
    pip3 install -U pyyaml
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
    npm install -g bower
    # npm install -g docpad
    npm install -g npm-check-updates
    npm install -g node-inspector
    npm install -g iron-node
    npm install -g karma-cli
    npm install -g github-release-from-changelog
    npm install -g flow-bin
    npm install -g mocha
    npm install -g coffee
    npm install -g coffeelint
    npm install -g gulp
    npm install -g webpack
    npm install -g eslint
    npm install -g jade-lint
    npm install -g yarn
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
    # rvm get head
    rvm get stable
    rvm reload
    echo

    # gems
    if command_exists gem; then
        header "Updating Ruby gems..."
        # sudo -v
        gem update
        echo
    fi
fi

# composer
if command_exists composer; then
    header "Updating composer packages..."

    composer global require phpdocumentor/phpdocumentor
    composer global require phpmd/phpmd
    composer global require squizlabs/php_codesniffer
    composer global require wp-cli/wp-cli
    composer global require "aaemnnosttv/wp-cli-dotenv-command:^1.0"
    composer global require mkusher/padawan

    composer global update
    echo
fi


# shipit
pathtoshipit=$DOTFILES/bin/shipit
curl -o $pathtoshipit https://raw.githubusercontent.com/sapegin/shipit/master/bin/shipit
chmod +x $pathtoshipit
unset pathtoshipit


