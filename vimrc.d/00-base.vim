set nocompatible

filetype plugin indent on
syntax on

set backspace=indent,eol,start
set hidden
set noswapfile
set wildmenu
set autoread
set incsearch hlsearch ignorecase smartcase
set ruler
set laststatus=2
set list listchars=trail:·,tab:→\ "
set autoindent
set smarttab
set expandtab
set tabstop=4
set shiftwidth=0
set scrolloff=7
set number relativenumber
set splitbelow splitright
set ttyfast
set mouse=a
set path+=**
set undofile
set undodir=~/.vim/undo-dir
set clipboard+=unnamedplus

let mapleader = "\<space>"
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <leader>cc :cclose<Cr>
nnoremap <leader>p o<Esc>p

inoremap jk <ESC>

" Show found line in the center of the screen
nnoremap n nzz
nnoremap N Nzz

" do not include linebreak character
vnoremap $ g_

" delete, replace without yanking
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D
vnoremap p "_dp
vnoremap P "_dP
nnoremap s "_s
vnoremap s "_s
nnoremap c "_c
vnoremap c "_c

" insert tabs more seamlessly
nnoremap > >>
nnoremap < <<
vnoremap <silent> > >gv
vnoremap <silent> < <gv

nnoremap @@ @q

" abbreviations
iab isntall install
iab Isntall Install
