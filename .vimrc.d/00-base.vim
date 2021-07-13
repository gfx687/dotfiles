set nocompatible

filetype plugin indent on
syntax on

" Hit `%` on `if` to jump to `else`.
runtime macros/matchit.vim

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

if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif

if has('persistent_undo')
  if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
  endif
  if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
  endif
  set undofile
  set undodir=~/.vim/undo-dir
endif

let g:netrw_banner=0
let g:netrw_liststyle=3

let mapleader = "\<space>"
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <leader>p o<Esc>p

" Show found line in the center of the screen
nnoremap n nzz
nnoremap N Nzz
nnoremap # #N

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

" TODO : configure foldcolumn
