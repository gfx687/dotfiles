call plug#begin('~/.vim/plugged')
Plug 'gfx687/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'

Plug 'sheerun/vim-polyglot'      " syntax highlighting
Plug 'tpope/vim-commentary'      " gcc to comment line
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'
Plug 'rust-lang/rust.vim'

" Plug 'preservim/tagbar'
" Plug 'AndrewRadev/splitjoin.vim' " turn oneline code into block
Plug 'wellle/targets.vim'        " more text objects
Plug 'jiangmiao/auto-pairs'      " autocompletion and autoindent for bracets
Plug 'markonm/traces.vim'        " substitute highlighting
Plug 'tpope/vim-surround'        " visual + S + surrounder
Plug 'justinmk/vim-sneak'        " Multiline F and T search by 2 characters
Plug 'gfx687/exec-in-tmux-split'
Plug 'takac/vim-hardtime'        " no repeating of jjj, kkk etc
call plug#end()

" :vim-sneak
map s <Plug>Sneak_s
map S <Plug>Sneak_S

" :fugitive :git
nnoremap <leader>gs :Git<Cr>
nnoremap <leader>gb :Git blame<Cr>
nnoremap <leader>gd :Gdiffsplit<Cr>
" stash list: :Glog -g stashes

" :ale
let g:ale_enabled = 0
let g:ale_fix_on_save = 1
let g:ale_fixers = {
    \ 'javascript': ['prettier', 'eslint'],
    \ 'rust':       ['rustfmt'],
    \ '*': ['remove_trailing_lines', 'trim_whitespace']
  \ }
let g:ale_linters = {
    \ 'cs': ['OmniSharp'],
    \ 'rust': ['cargo', 'rls']
  \ }

" :nerdtree
let g:NERDTreeWinPos = 'right'
let NERDTreeShowHidden=1
let NERDTreeQuitOnOpen=0
let g:NERDTreeWinSize=70

map <leader>nn :NERDTreeToggle<cr>
map <leader>nf :NERDTreeFind<cr>

" :vim-hardtime
let g:hardtime_default_on = 1
