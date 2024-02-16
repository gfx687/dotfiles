augroup Javascript_ft
    au!
    autocmd FileType javascript,jsx,typescript,tsx nmap <silent> <buffer> [[ :call GotoNext_Javascript()<CR>
    autocmd FileType javascript,jsx,typescript,tsx nmap <silent> <buffer> ]] :call GotoPrev_Javascript()<CR>
augroup end

func! GotoNext_Javascript()
    call search('^\(Deno.test\|function\|export\|async\)', 'b')
    nohlsearch
    " normal zt
endfunc!

func! GotoPrev_Javascript()
    call search('^\(Deno.test\|function\|export\|async\)', '')
    nohlsearch
    " normal zt
endfunc!

