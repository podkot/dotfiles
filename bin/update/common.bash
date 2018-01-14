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
if command_exists antibody; then
    antibody bundle < "$DOTFILES/etc/zsh_plugins.txt" > ~/.zsh_plugins.sh
    antibody update
fi

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


