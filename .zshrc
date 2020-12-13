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
        'git' \
        'history-substring-search' \
        'history'

  setopt globdots
  setopt menu_complete

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

    ZSH_AUTOSUGGEST_STRATEGY=("history")
    zgen load zsh-users/zsh-autosuggestions && _zsh_autosuggest_start

    zgen load paulirish/git-open

    zgen load denysdovhan/spaceship-prompt spaceship

    zgen save
  fi
}

# :setup
{
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

  kubectl() {
    if ! type __start_kubectl >/dev/null 2>&1; then
        source <(command kubectl completion zsh)
    fi

    command kubectl "$@"
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

  ONECOLORS='
    --color fg:#2a2b33
    --color bg:#f9f9f9
    --color fg+:#2a2b33
    --color bg+:#ececec
    --color info:#4C566A
    --color spinner:#4C566A
    --color header:#4C566A
    --color prompt:#7abd5c
    --color marker:#a3be8c
    --color pointer:#7abd5c
    --color hl:#7abd5c
    --color hl+:#7abd5c
  '

  export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS$ONECOLORS

  export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}

# :func
{
  create-and-change-directory() {
    mkdir -p "$@"
    cd "$@"
  }
}

# :alias
{
  alias v='nvim'
  alias py=python3
  alias rg='ranger'
  alias ck='create-and-change-directory'
  alias binchmod='chmod +x $HOME/.dotfiles/bin/shareable/* && chmod +x $HOME/.dotfiles/bin/non-shareable/*'
  alias l='ls -1Al'
  alias :q='exit'

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
