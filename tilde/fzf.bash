# Setup fzf
# ---------

if [[ "$IS_MAC" == 1 ]]; then
    fzf_base=/usr/local/opt/fzf
else
    fzf_base=$HOME/.fzf
fi

if [[ ! "$PATH" == *"$fzf_base"* ]]; then
  export PATH="$PATH:$fzf_base/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == *"$fzf_base/man"* && -d $fzf_base ]]; then
  export MANPATH="$MANPATH:$fzf_base/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "$fzf_base/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "$fzf_base/shell/key-bindings.bash"

