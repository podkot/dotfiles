#!/usr/bin/env bash

if [[ -d "$DOTFILES/lib/marker" ]]; then
    export MARKER_DATA_HOME="$DOTFILES/etc/marker"
    export MARKER_HOME="$DOTFILES/lib/marker"
    export MARKER_KEY_MARK="\C-s"
    source "$MARKER_HOME/bin/marker.sh"
fi
