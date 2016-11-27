#!/usr/bin/env bash

# sman
expect <<'END'
    set script [exec curl -s https://raw.githubusercontent.com/tokozedg/sman/master/install.sh]
    spawn bash -c $script

    expect "Do you want to update your shell configuration files?"
    send "n\r"

    expect "Copy snippets from repo to home?"
    send "n\r"
END
