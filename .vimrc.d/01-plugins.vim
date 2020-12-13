call plug#begin('~/.vim/plugged')
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'

if !exists('mini')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'SirVer/ultisnips'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
end

Plug 'sheerun/vim-polyglot'     " syntax highlighting
Plug 'tpope/vim-commentary'     " gcc to comment line

" use can use # or *, if needed
" Plug 'RRethy/vim-illuminate'    " Highlightes word under cursor

Plug 'jiangmiao/auto-pairs'     " Autocompletion and autoindent for bracets
Plug 'markonm/traces.vim'       " substitute highlighting
Plug 'tpope/vim-surround'       " visual + S + surrounder
Plug 'justinmk/vim-sneak'       " Multiline F and T search by 2 characters
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
  \             [ 'filename', 'readonly', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'gitbranch', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': '_lightline_gitbranch',
  \   'fileencoding': '_lightline_fileencoding',
  \ },
  \ }

function! _lightline_gitbranch()
  return fugitive#head() ==# '' ? '' : ' ' . fugitive#head()
endfunction

" show only if not utf-8
function! _lightline_fileencoding()
  return &fileencoding ==# 'utf-8' ? '' : (&fileencoding ==# '' ? 'no ft' : &fileencoding)
endfunction

" vim-sneak
map f <Plug>Sneak_s
map F <Plug>Sneak_S

if !exists('mini')
  " vim-fugitive
  nnoremap <leader>gs :Gstatus<Cr>

  " coc.nvim
  let g:coc_global_extensions = [ 'coc-snippets' ]

  " Always show the signcolumn, otherwise it would shift the text each time
  " diagnostics appear/become resolved.
  if has("patch-8.1.1564")
    " Recently vim can merge signcolumn and number column into one
    set signcolumn=number
  else
    set signcolumn=yes
  endif

  " fzf.vim
  let g:fzf_layout = { 'down': '~20%' }
  nnoremap <C-P> :Files<Cr>
  nnoremap <C-E> :Buffers<Cr>
  nnoremap <C-B> :History<Cr>

  " disable preview window
  let g:fzf_preview_window = []

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
