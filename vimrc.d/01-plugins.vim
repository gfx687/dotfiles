call plug#begin('~/.vim/plugged')
" Plug 'gfx687/vim-one'
" Plug 'arcticicestudio/nord-vim'
" Plug 'morhetz/gruvbox'
" Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'dense-analysis/ale'
"     let g:ale_enabled = 0
"     let g:ale_fix_on_save = 1
"     let g:ale_fixers = {
"         \ 'javascript': ['prettier', 'eslint'],
"         \ 'rust':       ['rustfmt'],
"         \ '*': ['remove_trailing_lines', 'trim_whitespace']
"       \ }
"     let g:ale_linters = {
"         \ 'cs': ['OmniSharp'],
"         \ 'rust': ['cargo', 'rls']
"       \ }

Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
    nnoremap <leader>gs :Git<Cr>
    nnoremap <leader>gb :Git blame<Cr>
    nnoremap <leader>gd :Gdiffsplit<Cr>

" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'preservim/nerdtree'
    let g:NERDTreeWinPos = 'right'
    let NERDTreeShowHidden=1
    let NERDTreeQuitOnOpen=0
    let g:NERDTreeWinSize=40

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nf :NERDTreeFind<cr>

" Plug 'sheerun/vim-polyglot'      " syntax highlighting
Plug 'tpope/vim-commentary'      " gc + text object to comment
" Plug 'mattn/emmet-vim'
" Plug 'OmniSharp/omnisharp-vim'
" Plug 'rust-lang/rust.vim'
" Plug 'preservim/vim-markdown'
Plug 'preservim/tagbar'
    nmap <F8> :TagbarToggle<CR>
    let g:tagbar_wrap=1

Plug 'wellle/targets.vim'        " more text objects
" Plug 'jiangmiao/auto-pairs'      " autocomp and autoindent, kinda buggy
                                 " using coc-pairs from coc.nvim instead
Plug 'gfx687/vim-ski'
    let g:skeletons_dir=$HOME . '/dotfiles/vimrc.d/skeletons/'

Plug 'junegunn/vim-easy-align'   " gaip= to align by = symbol
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)
Plug 'reedes/vim-lexical'        " spell-checking, [s ]s zg zug
" Plug 'junegunn/vim-easy-align'
Plug 'markonm/traces.vim'        " substitute highlighting
Plug 'tpope/vim-surround'        " visual + S + surrounder
Plug 'bronson/vim-trailing-whitespace'
Plug 'justinmk/vim-sneak'        " Multiline F and T search by 2 characters
    map s <Plug>Sneak_s
    map S <Plug>Sneak_S

Plug 'gfx687/exec-in-tmux-split'
" Plug 'takac/vim-hardtime'        " no repeating of jjj, kkk etc
"     let g:hardtime_default_on = 1
call plug#end()

" :vim-lexical
augroup lexical
      autocmd!
      autocmd FileType markdown,mkd call lexical#init()
augroup END
let g:lexical#spell_key = '<leader>s'
let g:lexical#thesaurus_key = '<leader>t'
