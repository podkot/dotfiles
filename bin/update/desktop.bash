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
    unset PYTHONPATH
    pip install -U pip
    pip install -U psutil
    pip install -U pyyaml
    pip install -U bashate
    pip install -U licen
    #pip install -U numpy scipy pandas
    #pip install -U scikit-learn matplotlib
    #pip install -U jupyter
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
    npm install -g yarn
    npm install -g np

    npm install -g webpack-cli
    npm install -g grunt-cli
    npm install -g gulp

    npm install -g jest

    npm install -g javascript-typescript-langserver
    npm install -g vue-language-server
    npm install -g tern

    npm install -g flow-bin
    npm install -g coffee
    npm install -g coffeelint
    npm install -g pug-lint
    npm install -g markdownlint-cli
    npm install -g less
    npm install -g bemlint

    npm install -g eslint
    npm install -g eslint-plugin-regru
    npm install -g eslint-plugin-shopify
    npm install -g eslint-plugin-promise
    npm install -g eslint-plugin-compat
    npm install -g eslint-plugin-vue
    npm install -g babel-eslint

    npm install -g vue-cli
    npm install -g caniuse-cmd
fi

# composer
if command_exists composer; then
    header "Updating composer packages"

    composer global require phpdocumentor/phpdocumentor
    composer global require phpmd/phpmd
    composer global require squizlabs/php_codesniffer
    composer global require wp-cli/wp-cli-bundle
    composer global require aaemnnosttv/wp-cli-dotenv-command

    composer global update
    echo
fi


# shipit
header "Updating shipit"
pathtoshipit=$DOTFILES/bin/shipit
curl -o $pathtoshipit https://raw.githubusercontent.com/sapegin/shipit/master/bin/shipit
chmod +x $pathtoshipit
unset pathtoshipit


