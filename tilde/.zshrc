DEBUG=${DEBUG:=0}
export DOTFILES="$HOME/dotfiles"
alias re="source ~/.zshrc"
alias de="DEBUG=1; time (source ~/.zshrc)"

source "$DOTFILES/shrc.d/inc/helpers.sh"

if [[ -f ~/.bashrc_vars ]]; then
    source ~/.bashrc_vars
fi

if [[ -d $DOTFILES/zshrc.d ]]; then
    for file in $DOTFILES/zshrc.d/*.sh; do
        import $file
    done
fi

if [[ -d $DOTFILES/shrc.d ]]; then
    for file in $DOTFILES/shrc.d/*.sh; do
        import $file
    done
fi

if [[ -f ~/.bashrc_local ]]; then
    source ~/.bashrc_local
fi
