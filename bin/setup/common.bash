#!/usr/bin/env bash

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

# even-better-ls
if [[ ! -d "$DOTFILES/lib/even-better-ls/" ]]; then
    pushd "$DOTFILES/lib"
        git clone git@github.com:podkot/even-better-ls.git
        chmod +x even-better-ls/ls_colors_generator.py
    popd
fi
