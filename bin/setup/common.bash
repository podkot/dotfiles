#!/usr/bin/env bash

# sman
expect <<'END'
    set script [exec curl -s https://raw.githubusercontent.com/tokozedg/sman/master/install.sh]
    spawn bash -c $script

    expect "Do you want to update your shell configuration files?"
    send "n\r"

    expect "Copy snippets from repo to home?"
    send "n\r"
END

# marker
if [[ ! -d "$DOTFILES/lib/marker/" ]]; then
    pushd "$DOTFILES/lib"
        git clone git@github.com:pindexis/marker.git
    popd
fi

# git when-merged
if [[ ! -d "$DOTFILES/lib/git-when-merged/" ]]; then
    pushd "$DOTFILES/lib"
        git clone git@github.com:mhagger/git-when-merged.git
        chmod +x git-when-merged/bin/git-when-merged
        ln -s "$DOTFILES/lib/git-when-merged/bin/git-when-merged" "$DOTFILES/bin/git-when-merged"
    popd
fi
