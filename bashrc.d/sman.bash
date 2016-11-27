if [[ -f ~/.sman/sman.rc ]]; then
    export SMAN_APPEND_HISTORY=true
    export SMAN_SNIPPET_DIR="$DOTFILES/etc/snippets"
    export SMAN_EXEC_CONFIRM=true
    export PATH=$PATH:~/.sman/bin
    source ~/.sman/sman.rc
    alias r="s r"
fi
