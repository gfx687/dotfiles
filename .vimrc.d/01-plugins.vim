call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'

if !exists('mini')
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'scrooloose/nerdtree'
end

Plug 'tpope/vim-commentary'     " gcc to comment line
Plug 'RRethy/vim-illuminate'    " Highlightes word under cursor
Plug 'jiangmiao/auto-pairs'     " Autocompletion and autoindent for bracets
Plug 'markonm/traces.vim'       " Search highlighting plugin
Plug 'tpope/vim-surround'       " visual + S + surrounder
Plug 'justinmk/vim-sneak'       " Multiline F and T search by 2 characters
Plug 'mustache/vim-mustache-handlebars' " helm teplates syntax support
call plug#end()

" Colorscheme
set t_Co=256
set background=light
colorscheme one

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" lightline
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'fugitive#head',
  \ },
  \ }

" vim-sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

if !exists('mini')
  " vim-fugitive
  nnoremap <leader>gs :Gstatus<Cr>

  " coc.nvim
  let g:coc_global_extensions = [ 'coc-snippets', 'coc-ultisnips' ]

  " nerdtree
  let g:NERDTreeWinPos = 'right'
  let NERDTreeShowHidden=1
  let g:NERDTreeWinSize=35

  map <leader>nn :NERDTreeToggle<cr>
  map <leader>nf :NERDTreeFind<cr>

  " fzf.vim
  let g:fzf_layout = { 'down': '~20%' }
  nnoremap <C-P> :Files<Cr>
  nnoremap <C-E> :Buffers<Cr>
  nnoremap <C-B> :History<Cr>

  " hide fzf statusline
  autocmd! FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

  " ultisnips
  let g:UltiSnipsExpandTrigger = "<nop>"
  let g:UltiSnipsJumpForwardTrigger = '<C-J>'
  let g:UltiSnipsJumpBackwardTrigger = '<C-K>'
  let g:UltiSnipsSnippetDirectories = [ $HOME . '/.vim/ultisnips' ]

  let g:UltiSnipsEnableSnipMate = 0
  let g:UltiSnipsEditSplit="horizontal"

  inoremap <silent> <Tab> <c-r>=_expand_snippet()<cr>
  xnoremap <silent> <Tab> <Esc>:call UltiSnips#SaveLastVisualSelection()<cr>gvs

  func! _expand_snippet()
    let g:_expand_snippet = 1
    call UltiSnips#ExpandSnippet()
    let g:_expand_snippet = 0

    if g:ulti_expand_res == 0
      if pumvisible()
        "&& !empty(v:completed_item)
        return coc#_select_confirm()
      else
        call coc#refresh()
        let col = col('.') - 1
        if !col || getline('.')[col - 1]  =~# '\s'
          return "\<tab>"
        end
      end
    else
      call coc#refresh()
      return ""
    end

    return "\<c-n>"
  endfunc
endif
