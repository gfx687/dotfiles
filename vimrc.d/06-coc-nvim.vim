" TODO:
" 1) close pop-up while in I mod hotkey
" 2) diagnostics - show whole project problems, not only current file
"    https://github.com/neoclide/coc.nvim/issues/2835
" 3) organize imports on format
" 4) LSP options appear twice for javascript in JSX files (maybe others too)
" 5) coc-snippets vs coc-ultisnips

" Keybinds:
"   C-N / C-P         - suggestion navigation (default)
"   C-Y               - expand suggestion     (default)
"   C-M / TAB         - expand suggestion     (custom)
"   C-D / C-U         - scroll preview window (custom)

" Configuration Questions:
"   codelens
"   hover
"   inlayHint

" coc-react-refactor - extract selected HTML into component
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-yaml',
    \ 'coc-snippets',
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-react-refactor',
    \ 'coc-deno',
    \ 'coc-pyright'
    \ ]

nmap <leader>f <Plug>(coc-format)
vmap <leader>f <Plug>(coc-format-selected)

nmap <silent> <F2> <Plug>(coc-rename)

nmap <silent> <leader>cf <Plug>(coc-codeaction-source)
nmap <silent> <leader>ca <Plug>(coc-codeaction-cursor)
xmap <silent> <leader>ca <Plug>(coc-codeaction-selected)
xmap <silent> <leader>ca <Plug>(coc-codeaction-selected)
nmap <silent> <leader>cd :CocDiagnostics<CR>

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gh :call CocActionAsync('doHover')<CR>
nmap <silent> gr :call CocActionAsync('jumpReferences')<CR>

imap <silent> <C-s> <C-r>=CocActionAsync('showSignatureHelp')<CR>

vmap <C-j> <Plug>(coc-snippets-select)

" Improvement of brakets and format on type (autoimports and such)
" :h coc#on_enter()
" inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <silent><expr> <CR> "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Completion on TAB
inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

" Remap <C-d> and <C-u> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  nnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
  inoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-d> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-d>"
  vnoremap <silent><nowait><expr> <C-u> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-u>"
endif
