augroup Javascript_ft
    au!
    au FileType javascript,jsx,typescript,tsx nmap <silent> <buffer> [[ :call GotoNext_Javascript()<CR>
    au FileType javascript,jsx,typescript,tsx nmap <silent> <buffer> ]] :call GotoPrev_Javascript()<CR>

    au FileType javascript,jsx,typescript,tsx setlocal tabstop=2
augroup end

func! GotoNext_Javascript()
    call search('^\(Deno.test\|function\|export\|async\|type\)', 'b')
    nohlsearch
    " normal zt
endfunc!

func! GotoPrev_Javascript()
    call search('^\(Deno.test\|function\|export\|async\|type\)', '')
    nohlsearch
    " normal zt
endfunc!

