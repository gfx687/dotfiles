_tmux_autocomplete() {
    capture=$(tmux capture-pane -p)

    pick=$(echo "$capture" | grep -oP '(\S+)' | sort -u | fzf --reverse --height 20%)

    echo $pick

    local ret=$?
    echo
    return $ret
}

tmux_autocomplete() {
    LBUFFER="$LBUFFER$(_tmux_autocomplete)"
    local ret=$?
    zle reset-prompt
    return $ret
}

zle     -N   tmux_autocomplete
# added to .zshrc for easier reading of custom bindings
# bindkey '^E' tmux_autocomplete
