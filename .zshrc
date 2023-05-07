# The following lines were added by compinstall
# zstyle :compinstall filename '/home/gfx687/.zshrc'
# autoload -Uz compinit
# compinit
# End of lines added by compinstall

# :prezto
{
    zstyle ':prezto:*:*' color 'yes'

    zstyle ':prezto:load' pmodule \
      'history' \
      'completion' \
      'history-substring-search' \
      'prompt'

    # https://github.com/sindresorhus/pure
    zstyle ':prezto:module:prompt' theme 'pure'
    zstyle ':prompt:pure:path' color cyan

    # changing pure symbols for dumb terminals and fonts
    # PURE_PROMPT_SYMBOL='->'
    # PURE_GIT_DOWN_ARROW='\/'
    # PURE_GIT_UP_ARROW='/\'
    # PURE_GIT_STASH_SYMBOL='(stash)'

    # zstyle ':completion:*' rehash true

    # Source Prezto.
    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
}

# :keybinds
{
    bindkey -M viins '^^' beginning-of-line
    bindkey -M viins '^\' end-of-line
    bindkey -M viins '^B' kill-word                 # delete word forward
    bindkey "^[[1;5C" forward-word                  # Ctrl-right
    bindkey -M viins "^L" forward-word
    bindkey "^[[1;5D" backward-word                 # Ctrl-left
    bindkey -M viins "^H" backward-word
}

# :setup
{
    unsetopt beep                                   # no beeps
    setopt autocd                                   # cd by just folder name
}

# :fzf
{
    # possibly only works for Debian, as fzf was installed via apt
    source /usr/share/doc/fzf/examples/key-bindings.zsh
    bindkey -v "^P" fzf-file-widget
    bindkey -v "^R" fzf-history-widget

    FZF_CTRL_R_OPTS='--layout=reverse'
    FZF_DEFAULT_COMMAND='fdfind --type file --follow --hidden --exclude .git'
    FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

# :func
{
    create-and-change-dir() {
        mkdir -p "$@"
        cd "$@"
    }

    diff-with-dsf() {
        diff "$@" | diff-so-fancy
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
    alias diff='diff-with-dsf'

    # :alias-git
    alias gl='PAGER=cat git log --oneline --graph --decorate --all --max-count=30'
    alias gs='git status --short'
    alias gc='git commit'
    alias gc!='git commit --amend --reuse-message HEAD'
    alias gca='git add .; git commit --all'
    alias gca!='git add .; git commit --all --amend --reuse-message HEAD'
    alias gd='git diff'
    alias gp='git push'

    # :alias-docker
    alias dk='docker '
    alias dko='docker-compose '
}

# plugins
#     zgen load seletskiy/zsh-zgen-compinit-tweak
#     zgen load zdharma/fast-syntax-highlighting
#     zgen load zsh-users/zsh-autosuggestions
