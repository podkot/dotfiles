#!/usr/bin/env bash

# powerline fonts
if [[ ! -d $DOTFILES/lib/fonts/ ]]; then
    git clone https://github.com/powerline/fonts $DOTFILES/lib/fonts
fi
header "Installing powerline fonts"
$DOTFILES/lib/fonts/install.sh
echo

# perlbrew
if command_exists perlbrew ; then
    echo "Perlbrew already installed"
else
    header "Installing perlbrew"
    \curl -L http://install.perlbrew.pl | bash
    perlbrew install perl-5.16.3
    cat $DOTFILES/data/perlbrew.txt | cpanm
fi
