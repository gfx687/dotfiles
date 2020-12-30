""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables Vim specific features

filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
syntax on                       " Unable syntax highlight for colorscheme

set clipboard=unnamedplus       " Use system clipboard
set mouse=a                     " Enable mouse
set laststatus=2                " Show status line always
set encoding=utf8               " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set relativenumber              " ... relatively to cursor line
set so=7                        " Number of context lines above and below the cursor
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set list                        " show spaces as characters
set lcs=trail:·,tab:→\ "        " show spaces as characters
set expandtab                   " Write spaces instead of tabs
set shiftwidth=2                " Spaces per tab (works with expandtab)
set autoindent                  " Enabile Autoindent
set updatetime=300              " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience


" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.vim/tempdirs/undodir
endif

set ttyfast
if !has('nvim')
  set ttymouse=xterm2
  set ttyscroll=3
endif


""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

let mapleader = "\<space>"
nnoremap <silent> <Leader>/ :noh<CR>
nnoremap <leader>p o<Esc>p

nmap <silent> <Leader>f :%!jq .<CR>

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

vnoremap > >gv
vnoremap < <gv

" Show found line in the center of the screen
nnoremap n nzz
nnoremap N Nzz

" do not include linebreak character
vnoremap $ g_


"""""""""""""""""""""
"      Hooks        "
"""""""""""""""""""""

" Remove trailing whitespaces on save
augroup _buf_write_pre
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup end
