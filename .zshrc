# The following lines were added by compinstall
# zstyle :compinstall filename '/home/gfx687/.zshrc'
# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# :prezto
{
    # Color output (auto set to 'no' on dumb terminals).
    zstyle ':prezto:*:*' color 'yes'

    zstyle ':prezto:load' pmodule \
      'history' \
      'completion' \
      'history-substring-search' \
      'prompt'

    # https://github.com/sindresorhus/pure
    zstyle ':prezto:module:prompt' theme 'pure'
    zstyle ':prompt:pure:path' color cyan

    # temporarily changing pure symbols for dumb terminal and font
    PURE_PROMPT_SYMBOL='->'
    PURE_GIT_DOWN_ARROW='\/'
    PURE_GIT_UP_ARROW='/\'
    PURE_GIT_STASH_SYMBOL='(stash)'

    # zstyle ':completion:*' rehash true

    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
}

# :keybinds
{
    bindkey "^[[1;5C" forward-word                   # Ctrl-right
    bindkey "^[[1;5D" backward-word                  # Ctrl-left
}

# :setup
{
    unsetopt beep                                    # no beeps
    setopt autocd                                    # cd by just folder name
}

# :func
{
    create-and-change-dir() {
        mkdir -p "$@"
        cd "$@"
    }
}

# :alias
{
    alias sudo='sudo '
    alias v='nvim'
    alias vim='nvim -u ~/dotfiles/vimrc.d/00-base.vim'
    alias py=python3
    alias ck='create-and-change-dir'
    alias l='ls --color=auto -lA'

    # :alias-git
    alias gl='PAGER=cat git log --oneline --graph --decorate --all --max-count=30'
    alias gc!='git commit --amend --reuse-message HEAD'
    alias gca='git add .; git commit --all'
    alias gca='git add .; git commit --all --amend --reuse-message HEAD'
    alias gd='git diff'
    alias gp='git push'

    # :alias-docker
    alias dk='docker '
    alias dko='docker-compose '
}

# old config

# if ! zgen saved; then
#     zgen load seletskiy/zsh-zgen-compinit-tweak
#     zgen load sorin-ionescu/prezto
#     zgen load mafredri/zsh-async
#
#     zgen load zdharma/fast-syntax-highlighting
#
#     # ZSH_AUTOSUGGEST_STRATEGY=("history")
#     zgen load zsh-users/zsh-autosuggestions && _zsh_autosuggest_start
#
#     zgen load paulirish/git-open
#
#     zgen load denysdovhan/spaceship-prompt spaceship
#
#     zgen save
# fi
#
# bindkey -v "^R" fzf-history-widget
# bindkey -v "^P" fzf-file-widget
#
# setopt extended_history
# setopt hist_expire_dups_first
# setopt hist_ignore_dups
# setopt hist_verify
# setopt inc_append_history
# setopt share_history
#
# # https://github.com/spaceship-prompt/spaceship-prompt
# SPACESHIP_PROMPT_ORDER=(user host dir git exec_time line_sep jobs exit_code char)
#
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_OPTS=$COLORS
# export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
