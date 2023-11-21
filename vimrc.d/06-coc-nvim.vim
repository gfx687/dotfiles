" TODO and Known Issues
" 1) close pop-up while in I mod hotkey
" 2) diagnostics - show whole project problems, not only current file
"    https://github.com/neoclide/coc.nvim/issues/2835

" Keybinds:
"   C-N / C-P         - suggestion navigation (default)
"   C-Y               - expand suggestion     (default)
"   Enter / C-M / TAB - expand suggestion     (custom)
"   C-D / C-U         - scroll preview window (custom)

" Configuration Questions:
"   codelens
"   colors
"   confirmKey
"   hover
"   inlayHint
"   notification
"   outline
"   snippet
"   suggest
"   coc-status

" Show signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" coc-react-refactor - extract selected HTML into component
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-pairs',
    \ 'coc-ultisnips',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-react-refactor'
    \ ]

nmap <leader>f <Plug>(coc-format)
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>ca <Plug>(coc-codeaction)
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>rn <Plug>(coc-rename)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi :call CocActionAsync('doHover')<CR>
nmap <silent> gr :call CocActionAsync('jumpReferences')<CR>

nmap <leader>dg :CocDiagnostics<CR>
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Improvement of brakets and format on type (autoimports and such)
" :h coc#on_enter()
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Completion on TAB
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

" Remap <C-d> and <C-u> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif
