unset MAILCHECK # Don't check mail when opening terminal.

shopt -s expand_aliases # for aliases to work in sourced scripts

tty -s && stty werase ^- 2>/dev/null # this is for delete words by ^W

export TERM=xterm-256color
