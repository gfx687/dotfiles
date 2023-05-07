"for f in split(glob('~/dotfiles/vimrc.d/*.vim'), '\n')
"    exe 'source' f
"endfor

source ~/dotfiles/vimrc.d/00-base.vim
source ~/dotfiles/vimrc.d/01-plugins.vim
source ~/dotfiles/vimrc.d/03-colors.vim
source ~/dotfiles/vimrc.d/04-lightline.vim

noh
