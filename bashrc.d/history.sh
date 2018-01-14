shopt -s histappend              # append to bash_history if Terminal.app quits
export HISTCONTROL=erasedups     # erase duplicates; alternative option: export HISTCONTROL=ignoredups
export HISTSIZE=5000             # resize history size
export AUTOFEATURE=true autotest

function rh {
  history | awk '{a[$2]++}END{for(i in a){print a[i] " " i}}' | sort -rn | head
}

# enter a few characters and press UpArrow/DownArrow
# to search backwards/forwards through the history
if [ -t 1 ]; then
    bind '"[A":history-search-backward'
    bind '"[B":history-search-forward'
fi
