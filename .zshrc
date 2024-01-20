# TODO and Known Issues
# 1) add a func to create backups for files
# 2) create base bash config like 00-vim to copy into remote machines. No mods, but all the aliases / settings (not zsh specific either, for base bash)

# The following lines were added by compinstall
zstyle :compinstall filename '/home/gfx687/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall

# prezto
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

    if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
      source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
    fi
}

# keybinds
{
    # scritps are in different places for different distros
    # check fzf README - /usr/share/docs/fzf
    source /usr/share/fzf/shell/key-bindings.zsh                  # fedora
    # source /usr/share/doc/fzf/examples/key-bindings.zsh           # debian
    bindkey -v "^P" fzf-file-widget
    bindkey -v "^T" fzf-file-widget
    bindkey -v "^R" fzf-history-widget

    source ~/dotfiles/bin/shareable/tmux-autocomplete.zsh
    bindkey '^ ' tmux_autocomplete

    bindkey -M viins '^^' beginning-of-line
    bindkey -M viins '^\' end-of-line
    bindkey -M viins '^B' kill-word                 # delete word forward
    bindkey "^[[1;5C" forward-word                  # Ctrl-right
    bindkey -M viins "^L" forward-word
    bindkey "^[[1;5D" backward-word                 # Ctrl-left
    bindkey -M viins "^H" backward-word
}

# setup
{
    unsetopt beep                                   # no beeps
    setopt autocd                                   # cd by just folder name

    # is needed for pyenv to work but slows dows zsh start
    # eval "$(pyenv init -)"
    # [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
}

# fzf
{
    export FZF_CTRL_R_OPTS='--layout=reverse'
    export FZF_DEFAULT_COMMAND='fd --type file --hidden --exclude .git --exclude node_modules'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

    # dracula colors
    export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9
        --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9
        --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6
        --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'

    if [[ $BACKGROUND == "light" ]]; then
        # catppuccin colors
        export FZF_DEFAULT_OPTS="
            --color=bg+:#ccd0da,bg:#eff1f5,spinner:#dc8a78,hl:#d20f39
            --color=fg:#4c4f69,header:#d20f39,info:#8839ef,pointer:#dc8a78
            --color=marker:#dc8a78,fg+:#4c4f69,prompt:#8839ef,hl+:#d20f39"

        # solarized light
        export FZF_DEFAULT_OPTS="
            --color=bg+:#eee8d5,bg:#fdf6e3,hl:#2aa198,hl+:#2aa198
            --color=fg:#657b83,fg+:#4c4f69,header:#d20f39,info:#2aa198
            --color=marker:#dc8a78,pointer:#dc8a78,prompt:#2aa198,spinner:#dc8a78"
    fi
}

# tmux
{
    if [ ! -d ~/.tmux ] || [ ! -d ~/.tmux/tmux-resurrect ]; then
        mkdir -p ~/.tmux/tmux-resurrect
        git clone https://github.com/tmux-plugins/tmux-resurrect ~/.tmux/tmux-resurrect
    fi
}

# func
{
    create-and-change-dir() {
        mkdir -p "$@"
        cd "$@"
    }

    diff-with-dsf() {
        diff "$@" | diff-so-fancy
    }
}

# alias
{
    alias sudo='sudo '
    alias v='nvim'
    alias vim='nvim -u ~/dotfiles/vimrc.d/00-base.vim'
    alias py=python3
    alias ck='create-and-change-dir'
    alias l='ls --color=auto -lA'
    alias diff='diff-with-dsf'
    # alias fd='fdfind '
    alias treegi='rg --files | tree --fromfile'
    # sudo cp --archive /etc/ufw/before6.rules /etc/ufw/before6.rules-COPY-$(date +"%Y%m%d%H%M%S")

    # :alias-git
    alias gl='PAGER=cat git log --oneline --graph --decorate --all --max-count=30'
    alias gs='git status --short'
    alias gc='git commit'
    alias gc!='git commit --amend --reuse-message HEAD'
    alias gca='git add .; git commit --all'
    alias gca!='git add .; git commit --all --amend --reuse-message HEAD'
    alias gd='git diff'
    alias gd1='git diff HEAD~1 HEAD'
    alias gp='git push'

    # :alias-docker
    alias dk='docker '
    alias dko='docker compose '
}

# plugins
#     zgen load seletskiy/zsh-zgen-compinit-tweak
#     zgen load zdharma/fast-syntax-highlighting
#     zgen load zsh-users/zsh-autosuggestions
