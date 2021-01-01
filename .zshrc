docompinit() {
  compinit -C
}

typeset -U path
typeset -U fpath

# :prezto
{
  zstyle ':prezto:*:*' color 'yes'
  zstyle ':prezto:load' pmodule \
        'completion' \
        'history' \
        'git'

  # zstyle ':prezto:module:editor' key-bindings 'vi'
  zstyle ':completion:*' rehash true
}

# :zgen
{
  if [ ! -d ~/.zgen ]; then
    git clone https://github.com/tarjoilija/zgen ~/.zgen
  fi

  if [ ! -d ~/.zpezto ]; then
    ln -sf ~/.zgen/sorin-ionescu/prezto-master ~/.zprezto
  fi

  source ~/.zgen/zgen.zsh

  docompinit

  if ! zgen saved; then
    zgen load seletskiy/zsh-zgen-compinit-tweak
    zgen load sorin-ionescu/prezto
    zgen load mafredri/zsh-async

    zgen load zdharma/fast-syntax-highlighting

    # ZSH_AUTOSUGGEST_STRATEGY=("history")
    zgen load zsh-users/zsh-autosuggestions && _zsh_autosuggest_start

    zgen load paulirish/git-open

    zgen load denysdovhan/spaceship-prompt spaceship

    zgen save
  fi
}

# :setup
{
  bindkey -v "^R" fzf-history-widget
  bindkey -v "^P" fzf-file-widget
  bindkey -v '\x1bb' backward-word
  bindkey -v '\x1bf' forward-word

  setopt extended_history
  setopt hist_expire_dups_first
  setopt hist_ignore_dups
  setopt hist_verify
  setopt inc_append_history
  setopt share_history

  path+=("$HOME/.dotfiles/bin/shareable")
  path+=("$HOME/.dotfiles/bin/non-shareable")
  # chmod +x ~/.dotfiles/bin/shareable/*
  # chmod +x ~/.dotfiles/bin/non-shareable/*

  export TERM=xterm-256color
  export LC_ALL=en_US.UTF-8
  export LANG=en_US.UTF-8
  export VISUAL=nvim
  export EDITOR=nvim
  export PSQL_EDITOR="nvim-mini +\"set filetype\"=sql"
  export GOPATH="$HOME/go"
  export THEME=onelight

  kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi
    command kubectl "$@"
  }

  # breaks paths autocompletion
  # compctl -K _dotnet_zsh_complete dotnet

  # nvm
  export NVM_DIR="$HOME/.nvm"
  # [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  # [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

  node() {
    lazy_load_nvm
    node $@
  }
}

# :prompt
{
  if [ ! -d "$HOME/.zsh/pure" ]; then
    mkdir -p "$HOME/.zsh"
    git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
  fi

  fpath+=("$HOME/.zsh/pure")

  autoload -U promptinit; promptinit

  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=241"
  # zstyle ':prompt:pure:prompt:*' color cyan
  # zstyle ':prompt:pure:path' color cyan

  # prompt pure
  prompt spaceship

  # SPACESHIP_KUBECTL_SHOW=true
  SPACESHIP_DIR_TRUNC=5
  SPACESHIP_DIR_TRUNC_PREFIX=".../"
  SPACESHIP_PROMPT_ORDER=(user host dir git exec_time line_sep jobs exit_code char)

  # UNbold prompt and remove bad chars
  () {
    local z=$'\0'
    PROMPT='${${${$(spaceship_prompt)//\%\%/'$z'}//\%B}//'$z'/%%}'
  }
}

# :git
{
  if [ ! -f "$HOME/.zsh/diff-so-fancy" ]; then
    curl -s 'https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy' --output "$HOME/.zsh/diff-so-fancy"

    chmod +x $HOME/.zsh/diff-so-fancy
  fi

  if [ ! -f "$HOME/.zsh/git-log-compact" ]; then
    curl -s 'https://raw.githubusercontent.com/mackyle/git-log-compact/b17e4ec6f6e1ddb206c6a6ab24f053798790f32b/git-log-compact' --output "$HOME/.zsh/git-log-compact"

    chmod +x $HOME/.zsh/git-log-compact
  fi

  path+=("$HOME/.zsh")
}

# :search
{
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

  # one orig
  # --color bg:#f9f9f9
  # --color bg+:#ececec
  ONECOLORS='
    --color fg:#2a2b33
    --color bg:#eeeeee
    --color fg+:#2a2b33
    --color bg+:#d3d3d3
    --color info:#4C566A
    --color spinner:#4C566A
    --color header:#4C566A
    --color prompt:#7abd5c
    --color marker:#a3be8c
    --color pointer:#7abd5c
    --color hl:#7abd5c
    --color hl+:#7abd5c
  '
  NORDCOLORS='
    --color=fg:#e5e9f0
    --color=bg:#3b4252
    --color=hl:#8FBCBB
    --color=fg+:#e5e9f0
    --color=bg+:#3b4252
    --color=hl+:#8FBCBB
    --color=info:#eacb8a
    --color=prompt:#bf6069
    --color=pointer:#b48dac
    --color=marker:#a3be8b
    --color=spinner:#b48dac
    --color=header:#a3be8b
  '
  GRUVBOXCOLORS='
    --color=fg:#ebdbb2
    --color=fg+:#ebdbb2
    --color=bg:#282828
    --color=bg+:#282828
    --color=hl:#689d6a
    --color=hl+:#458588
    --color=info:#689d6a
    --color=prompt:#689d6a
    --color=pointer:#458588
    --color=marker:#458588
    --color=spinner:#458588
    --color=header:#458588
  '

  COLORS=$ONECOLORS
  if [[ "$THEME" == "nord" ]]; then COLORS=$NORDCOLORS; fi
  if [[ "$THEME" == "gruvbox" ]]; then COLORS=$GRUVBOXCOLORS; fi

  export FZF_DEFAULT_OPTS=$COLORS
  export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

# :func
{
  create-and-change-directory() {
    mkdir -p "$@"
    cd "$@"
  }

  lazy_load_nvm() {
    unset -f node
    export NVM_DIR=~/.nvm
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
  }

  _dotnet_zsh_complete()
  {
    local completions=("$(dotnet complete "$words")")

    reply=( "${(ps:\n:)completions}" )
  }
}

# :alias
{
  alias v='nvim'
  alias vim='vim -u ~/.dotfiles/.vimrc.d/00-base.vim'
  alias py=python3
  alias ck='create-and-change-directory'
  alias binchmod='chmod +x $HOME/.dotfiles/bin/shareable/* && chmod +x $HOME/.dotfiles/bin/non-shareable/*'
  alias l='ls -1Al'

  alias clipcopy='xclip -in -selection clipboard'
  alias clippaste='xclip -out -selection clipboard'

  # :alias-git
  alias gl='git-log-compact --graph --max-count=30 --all --decorate'
  alias gc!='git commit --amend --reuse-message HEAD'
  alias gca='git add .; git commit --all'
  alias gca!='git add .; git commit --all --amend --reuse-message HEAD'

  alias gd='gwd && echo -e "\n\033[1;33mSTATUS:" && gws -uall'
  alias gdo='git diff origin/master'

  # :alias-kubectl
  alias k=kubectl
  alias kx='kubectl delete'
  alias kc='kubectl create'
  alias ka='kubectl apply -f '
  alias kex='kubectl exec -it'

  alias kg='kubectl get'
  alias kga='kubectl get all'
  alias kgp='kubectl get po'

  alias kd='kubectl describe'
  alias kl='kubectl logs'
  alias kpf='kubectl port-forward '

  # :alias-docker
  alias dk='docker '
  alias dko='docker-compose'
}
