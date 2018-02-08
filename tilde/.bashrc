export DEBUG=${DEBUG:=0}
export DOTFILES="$HOME/dotfiles"
alias re="time source ~/.bashrc"
alias de="DEBUG=1; time source ~/.bashrc"

source "$DOTFILES/shrc.d/inc/helpers.sh"

# shell is non-interactive. be done now!
if [[ $- != *i* ]] ; then
  return
fi

if [[ -f ~/.bashrc_vars ]]; then
    source ~/.bashrc_vars
fi


if [[ -d $DOTFILES/bashrc.d ]]; then
    for file in $DOTFILES/bashrc.d/*.sh; do
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
