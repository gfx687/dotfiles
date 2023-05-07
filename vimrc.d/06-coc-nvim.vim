" Show signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=number

let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-vimlsp'
    \ ]

" Completion on TAB
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

nmap <leader>f <Plug>(coc-format)
vmap <leader>f <Plug>(coc-format-selected)
nmap <leader>ca <Plug>(coc-codeaction)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <leader>dg :CocDiagnostics<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction




" let g:coc_global_extensions = [
"     \ 'coc-snippets',
"     \ 'coc-tsserver',
"     \ 'coc-eslint',
"     \ 'coc-json',
"     \ 'coc-html',
"     \ 'coc-css',
"     \ 'coc-highlight',
"     \ 'coc-go',
"     \ 'coc-rls',
"     \ 'coc-sql'
"   \ ]

" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gr <Plug>(coc-references)
" nmap <leader>cr <Plug>(coc-rename)
" xmap if <Plug>(coc-funcobj-i)
" omap if <Plug>(coc-funcobj-i)
" xmap af <Plug>(coc-funcobj-a)
" omap af <Plug>(coc-funcobj-a)
" xmap ic <Plug>(coc-classobj-i)
" omap ic <Plug>(coc-classobj-i)
" xmap ac <Plug>(coc-classobj-a)
" omap ac <Plug>(coc-classobj-a)

" hi CocInfoSign ctermfg=Gray guifg=Gray
" if has('nvim')
" inoremap <silent><expr> <c-space> coc#refresh()
" else
" inoremap <silent><expr> <c-@> coc#refresh()
" endif

" nnoremap <silent><C-\> :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction
