# trick to make aliases available when using sudo
alias sudo='sudo '

# Easier navigation: .., ..., ...., ....., ~ and -
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

alias md='mkdir -p'
alias rd='rmdir'

# misc aliases
alias x="exit"

alias psg="ps auxw | grep"

alias 777="find . -type d -exec chmod 0777 {} ';' && find . -type f -exec chmod 0666 {} ';'"
alias 666="find . -type d -exec chmod 0777 {} ';' && find . -type f -exec chmod 0666 {} ';'"
alias 755="find . -type d -exec chmod 0755 {} ';' && find . -type f -exec chmod 0644 {} ';'"
alias 644="find . -type d -exec chmod 0755 {} ';' && find . -type f -exec chmod 0644 {} ';'"
alias sudo777="find . -type d -exec sudo chmod 0777 {} ';' && find . -type f -exec sudo chmod 0666 {} ';'"
alias sudo666="find . -type d -exec sudo chmod 0777 {} ';' && find . -type f -exec sudo chmod 0666 {} ';'"
alias sudo755="find . -type d -exec sudo chmod 0755 {} ';' && find . -type f -exec sudo chmod 0644 {} ';'"
alias sudo644="find . -type d -exec sudo chmod 0755 {} ';' && find . -type f -exec sudo chmod 0644 {} ';'"
alias own="sudo chown -R `whoami`"


# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# configs
alias hosts="$EDITOR /etc/hosts"
alias dotfiles="cd $DOTFILES && $EDITOR $DOTFILES ~/.bashrc_local ~/.bashrc_vars ~/dotfiles/bin/update/desktop.bash"

