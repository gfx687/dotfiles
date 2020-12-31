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
set expandtab
set scrolloff=7
set number "relativenumber
set splitbelow splitright
set ttyfast
set mouse=a

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

let mapleader = "\<space>"
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <leader>p o<Esc>p

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

"""""""""""""""""""""
"      Hooks        "
"""""""""""""""""""""

" Remove trailing whitespaces on save
augroup _buf_write_pre
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end
