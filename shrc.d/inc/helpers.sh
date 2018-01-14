export PATH="$PATH:$DOTFILES/bin"

if [[ `uname` == 'Darwin' ]]; then
    export IS_MAC=1
else
    export IS_MAC=0
fi

if [[ -n "$SSH_CLIENT" ]] || [[ -n "$SSH_TTY" ]]; then
    SESSION_TYPE=remote/ssh
else
    case $(ps -o comm= -p $PPID) in
        sshd|*/sshd) SESSION_TYPE=remote/ssh;;
    esac
fi
if [[ -z $SESSION_TYPE ]]; then
    export IS_DESKTOP=1
else
    export IS_DESKTOP=0
fi

function command_exists() {
    type "$1" &> /dev/null ;
}

function header() {
    echo -e "$(tput sgr 0 1)$(tput setaf 6)$1$(tput sgr0)"
}

function import() {
    if [[ "$1" == *"-desktop.sh" && "$IS_DESKTOP" == 0 ]]; then
        return;
    fi

    if [[ "$1" == *"-mac.sh" && "$IS_MAC" == 0 ]]; then
        return;
    fi

    if [[ "$1" == *"-linux.sh" && "$IS_MAC" == 1 ]]; then
        return;
    fi

    if [[ "$DEBUG" == "1" ]]; then
        echo "$1";
        time ( source "$1" )
        echo
        echo "---"
        echo
    else
        source "$1"
    fi
}

function antiup() {
    if command_exists antibody; then
        antibody bundle < "$DOTFILES/etc/zsh_plugins.txt" > ~/.zsh_plugins.sh
        antibody update
    fi
}
