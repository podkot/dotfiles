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

# rvm
if command_exists rvm ; then
    echo "RVM already installed"
else
    header "Installing RVM..."
    gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
    echo "gem: --no-document" >> ~/.gemrc
    \curl -sSL https://get.rvm.io | bash -s stable --ruby --gems=gem,bundler
fi
