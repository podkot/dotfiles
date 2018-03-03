export FZF_DEFAULT_COMMAND='fd --type f --follow --hidden --exclude .git'
export FZF_DEFAULT_OPTS="--ansi --cycle --preview='[[ \$(file --mime {}) =~ binary ]] && echo Binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
