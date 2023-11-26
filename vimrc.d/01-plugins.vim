" TODO and Known Issues
" 1) EasyAlign - dont add spaces around delimiter
" 2) auto-completion of react components in JSX adds '()' after component name
"    inside HTML tags
" 3) vim-markdown considers tags on top of the file to be headers and makes
"    folds for time

call plug#begin('~/.vim/plugged')
Plug 'gfx687/catppuccin-nvim', { 'as': 'catppuccin' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
    nnoremap <leader>gs :Git<Cr>
    nnoremap <leader>gb :Git blame<Cr>
    nnoremap <leader>gd :Gdiffsplit<Cr>

Plug 'preservim/nerdtree'
    let g:NERDTreeWinPos = 'left'
    let NERDTreeShowHidden=1
    let NERDTreeQuitOnOpen=0
    let g:NERDTreeWinSize=40

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nf :NERDTreeFind<cr>

Plug 'norcalli/nvim-colorizer.lua'     " :ColorizerToggle
Plug 'tpope/vim-commentary'            " gc + text object to comment
Plug 'preservim/vim-markdown'
" Plug 'preservim/tagbar'
"     nmap <F8> :TagbarToggle<CR>
"     let g:tagbar_wrap=1

Plug 'wellle/targets.vim'              " more text objects
Plug 'gfx687/vim-ski'
    let g:skeletons_dir=$HOME . '/dotfiles/vimrc.d/skeletons/'

" gaip= to align by first =, gaip-1= - by last, gaip*= by all
" gaip + CTRL-X for regexp
Plug 'junegunn/vim-easy-align'
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)

Plug 'reedes/vim-lexical'              " spell-checking, [s ]s <leader>s zg zug
Plug 'markonm/traces.vim'              " substitute highlighting
Plug 'tpope/vim-surround'              " visual + S + surrounder
Plug 'bronson/vim-trailing-whitespace' " :FixWhitespace
Plug 'justinmk/vim-sneak'              " multiline 2-character search
    map s <Plug>Sneak_s
    map S <Plug>Sneak_S

Plug 'gfx687/exec-in-tmux-split'

" Plug 'OmniSharp/omnisharp-vim'

" javascript
" Plug 'styled-components/vim-styled-components'
" Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
call plug#end()

" :vim-lexical
augroup lexical
      autocmd!
      autocmd FileType markdown,mkd call lexical#init()
augroup END

let g:lexical#spell_key = '<leader>s'
let g:lexical#thesaurus_key = '<leader>t'
