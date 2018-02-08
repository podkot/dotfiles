#!/usr/bin/env bash

# powerline fonts
if [[ -d "$DOTFILES/lib/fonts/" ]]; then
    header "Updating powerline fonts"
    pushd "$DOTFILES/lib/fonts"
        git pull
    popd
fi

# vim
header "Updating vim plugins"
vim +PluginInstall +qall

# .bashrc_vars
if [[ ! -f ~/.bashrc_vars ]]; then
    header "Creating ~/.bashrc_vars"
    cp "$DOTFILES/bashrc_vars_example.bash" ~/.bashrc_vars
fi

# antybody
antiup

# marker
if [[ -d "$DOTFILES/lib/marker/" ]]; then
    header "Updating marker"
    pushd "$DOTFILES/lib/marker"
        git pull
    popd
fi

# diff-so-fancy
header "Updating diff-so-fancy"
pathtodiff=$DOTFILES/bin/diff-so-fancy
curl -o $pathtodiff https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x $pathtodiff
unset pathtodiff

# git when-merged
if [[ -d "$DOTFILES/lib/git-when-merged/" ]]; then
    header "Updating git-when-merged"
    pushd "$DOTFILES/lib/git-when-merged"
        git pull
    popd
fi

# rmate (rsubl)
header "Updating rmate (rsubl)"
pathtormate=$DOTFILES/bin/rsubl
curl -o $pathtormate https://raw.githubusercontent.com/aurora/rmate/master/rmate
chmod +x $pathtormate
unset pathtormate

# iterm2 integration
header "Updating iTerm2 integrations"
if [[ ! -d "$DOTFILES/lib/iterm2" ]]; then
    mkdir "$DOTFILES/lib/iterm2"
fi
curl -L https://iterm2.com/shell_integration/zsh -o "$DOTFILES/lib/iterm2/iterm2_shell_integration.zsh"
curl -L https://iterm2.com/shell_integration/bash -o "$DOTFILES/lib/iterm2/iterm2_shell_integration.bash"
