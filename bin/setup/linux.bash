#!/usr/bin/env bash

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --no-update-rc --bin

curl -sL git.io/antibody | bash -s
