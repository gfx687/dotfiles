augroup Javascript_ft
    au!
    autocmd FileType javascript,jsx,typescript,tsx nmap <silent> <buffer> [[ :call GotoNext()<CR>
    autocmd FileType javascript,jsx,typescript,tsx nmap <silent> <buffer> ]] :call GotoPrev()<CR>
augroup end

func! GotoNext()
    call search('^\(Deno.test\|function\|export\|async\)', 'b')
    nohlsearch
    normal zt
endfunc!

func! GotoPrev()
    call search('^\(Deno.test\|function\|export\|async\)', '')
    nohlsearch
    normal zt
endfunc!

