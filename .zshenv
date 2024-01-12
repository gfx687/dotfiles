export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export VISUAL=nvim
export EDITOR=nvim
export LESS='--mouse --wheel-lines=4 -Q -z-4'
export GOPATH="$HOME/go"
export BACKGROUND=light
export PYENV_ROOT="$HOME/.pyenv"
export DENO_INSTALL="$HOME/.deno"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the list of directories that Zsh searches for programs.
path=(
  $HOME/{,s}bin(N)
  $HOME/.local/bin
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $HOME/dotfiles/bin/shareable
  $HOME/dotfiles/bin/non-shareable
  $GOPATH/bin
  /usr/local/go/bin
  $path
  $DENO_INSTALL/bin
)
