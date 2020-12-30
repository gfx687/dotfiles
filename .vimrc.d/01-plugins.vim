call plug#begin('~/.vim/plugged')
Plug 'gfx687/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'morhetz/gruvbox'
Plug 'itchyny/lightline.vim'

if !exists('mini')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'dense-analysis/ale'
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " Plug 'yuki-ycino/fzf-preview.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
  Plug 'preservim/nerdtree'
end

Plug 'sheerun/vim-polyglot'      " syntax highlighting
Plug 'tpope/vim-commentary'      " gcc to comment line
Plug 'mattn/emmet-vim'
Plug 'OmniSharp/omnisharp-vim'

" use can use # or *, if needed
" Plug 'RRethy/vim-illuminate'     " Highlightes word under cursor

Plug 'AndrewRadev/splitjoin.vim' " turn oneline code into block
Plug 'wellle/targets.vim'        " more text objects
Plug 'jiangmiao/auto-pairs'      " autocompletion and autoindent for bracets
Plug 'markonm/traces.vim'        " substitute highlighting
Plug 'tpope/vim-surround'        " visual + S + surrounder
Plug 'justinmk/vim-sneak'        " Multiline F and T search by 2 characters
call plug#end()

" :vim-sneak
map s <Plug>Sneak_s
map S <Plug>Sneak_S

if !exists('mini')
  " :fugitive :git
  nnoremap <leader>gs :Gstatus<Cr>
  nnoremap <leader>gb :Gblame<Cr>
  " stash list: :Glog -g stashes

  " :ale
  let g:ale_linters = { 'cs': ['OmniSharp'] }

  " :coc.nvim
  let g:coc_global_extensions = [ 'coc-snippets', 'coc-tsserver', 'coc-json' ]

  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gr <Plug>(coc-references)
  nmap <silent> [g <Plug>(coc-diagnostic-prev)
  nmap <silent> ]g <Plug>(coc-diagnostic-next)
  nmap <leader>cr <Plug>(coc-rename)
  nmap <leader>ca <Plug>(coc-codeaction)
  nmap <leader>f <Plug>(coc-format)
  vmap <leader>f <Plug>(coc-format-selected)

  hi CocInfoSign ctermfg=Gray guifg=Gray
  if has('nvim')
    inoremap <silent><expr> <c-space> coc#refresh()
  else
    inoremap <silent><expr> <c-@> coc#refresh()
  endif

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " :nerdtree
  let g:NERDTreeWinPos = 'right'
  let NERDTreeShowHidden=1
  let NERDTreeQuitOnOpen=1
  let g:NERDTreeWinSize=35

  map <leader>nn :NERDTreeToggle<cr>
  map <leader>nf :NERDTreeFind<cr>

  " :ultisnips
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
