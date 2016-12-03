#!/usr/bin/env bash

unset MAILCHECK # Don't check mail when opening terminal.

shopt -s expand_aliases # for aliases to work in sourced scripts

tty -s && stty werase ^- 2>/dev/null # this is for delete words by ^W

stty -ixon > /dev/null 2>/dev/null # to bind C-q C-s

export TERM=xterm-256color

export LANG=ru_RU.UTF-8 # otherwise powerline line wrapping doesn't work
