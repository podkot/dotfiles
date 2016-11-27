#!/usr/bin/env bash

# bash-it
if [[ ! -d $DOTFILES/lib/bash_it/ ]]; then
    header "Installing bash_it"
    git clone --depth=1 https://github.com/Bash-it/bash-it.git $DOTFILES/lib/bash_it
    # $DOTFILES/lib/bash_it/install.sh
    echo
fi

# sman
expect <<'END'
    set script [exec curl -s https://raw.githubusercontent.com/tokozedg/sman/master/install.sh]
    spawn bash -c $script

    expect "Do you want to update your shell configuration files?"
    send "n\r"

    expect "Copy snippets from repo to home?"
    send "n\r"
END
