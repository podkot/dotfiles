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
    pip install -U psutil
fi

if command_exists pip2 ; then
    header "Updating pip2"
    pip2 install -U pip
    pip2 install -U psutil
fi

if command_exists pip3 ; then
    header "Updating pip3"
    pip3 install -U pip
    pip3 install -U pyyaml
    pip3 install -U bashate
    pip3 install -U licen
    #pip3 install -U numpy scipy pandas
    #pip3 install -U scikit-learn matplotlib
    #pip3 install -U jupyter
fi

# n node
if command_exists n; then
    header "Updating node"
    node --version | grep $NODE_VERSION. || n $NODE_VERSION;
fi;

# npm
if command_exists npm ; then
    header "Installing/updating npm packages"
    npm config set loglevel warn
    npm config set save-prefix ''
    npm install -g npm
    npm install -g grunt-cli
    npm install -g bower
    npm install -g npm-check-updates
    # npm install -g node-inspector
    # npm install -g iron-node
    # npm install -g karma-cli
    # npm install -g github-release-from-changelog
    npm install -g flow-bin
    npm install -g jest
    npm install -g mocha
    npm install -g coffee
    npm install -g coffeelint
    npm install -g gulp
    npm install -g webpack
    npm install -g jade-lint
    npm install -g yarn
    npm install -g tern
    # npm install -g feathers-cli
    # npm install -g sequelize-cli
    npm install -g vue-cli
    npm install -g caniuse-cmd

    npm install -g javascript-typescript-langserver
    npm install -g vue-language-server
    npm install -g grateful

    npm install -g eslint
    npm install -g eslint-plugin-regru
    npm install -g eslint-plugin-shopify
    npm install -g eslint-plugin-promise
    npm install -g eslint-plugin-compat
    npm install -g eslint-plugin-vue
    npm install -g babel-eslint

    npm install -g yo
    npm install -g generator-generator
fi

# ruby
if command_exists ruby-install; then
    header "Updating ruby"
    which ruby | grep $RUBY_VERSION. || ruby-install ruby $RUBY_VERSION
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
    #composer global require mkusher/padawan
    composer global require symfony/thanks

    composer global update
    echo
fi


# shipit
header "Updating shipit"
pathtoshipit=$DOTFILES/bin/shipit
curl -o $pathtoshipit https://raw.githubusercontent.com/sapegin/shipit/master/bin/shipit
chmod +x $pathtoshipit
unset pathtoshipit


