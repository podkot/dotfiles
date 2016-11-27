#!/usr/bin/env bash

# perlbrew reinstall:
# perlbrew list-modules | perlbrew exec --with perl-5.20.0@foo-project cpanm

# if command_exists cpan-outdated; then
#     # you will need to repeat this for every Perl you have installed under it
#     cpan-outdated -p | cpanm
# fi

# pip
if command_exists pip ; then
    header "Updating pip"
    pip install -U pip
    pip install -U licen
fi

if command_exists pip3 ; then
    header "Updating pip3"
    pip3 install -U pyyaml
fi

# n node
if command_exists n; then
    header "Updating stable node"
    n stable;
fi;

# npm
if command_exists npm ; then
    header "Installing/updating npm packages"
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
    npm install -g tern
fi

# ruby
if command_exists ruby-install; then
    header "Updating ruby"
    which ruby | grep 2.2. || ruby-install ruby 2.2
    echo

    # gems
    if command_exists gem; then
        header "Updating ruby gems"
        command_exists bundler || gem install bundler
        gem update
        echo
    fi
fi

# composer
if command_exists composer; then
    header "Updating composer packages"

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
header "Updating shipit"
pathtoshipit=$DOTFILES/bin/shipit
curl -o $pathtoshipit https://raw.githubusercontent.com/sapegin/shipit/master/bin/shipit
chmod +x $pathtoshipit
unset pathtoshipit


