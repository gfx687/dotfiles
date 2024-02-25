# register custom ZSH command tmux_autocomplete
#
# Usage:
# add the following lines to your .zshrc
# source ~/dotfiles/bin/shareable/tmux-autocomplete.zsh
# bindkey '^ ' tmux_autocomplete

tmux_autocomplete() {
    LBUFFER="$LBUFFER$(tmux-fzf-visible-text)"
    local ret=$?
    zle reset-prompt
    return $ret
}

zle     -N   tmux_autocomplete
