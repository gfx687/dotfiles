for f in split(glob('~/dotfiles/vimrc.d/*.vim'), '\n')
    exe 'source' f
endfor

noh
