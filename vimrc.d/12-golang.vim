augroup Golang_ft
    au!
    " au FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
    au FileType go setlocal cc=120

    au FileType go nmap <leader>r :GoRun .<Cr>
    " au FileType go nmap <leader>rf :GoRun %<Cr>
    au FileType go nmap <leader>tt :GoTest<Cr>
    au FileType go nmap <leader>tf :GoTestFile<Cr>
    au FileType go nmap <leader>tl :GoTestFunc<Cr>
    au FileType go nmap <leader>ta :GoAlternate<Cr>
    au FileType go nmap <leader>tc :GoCoverageToggle<Cr>
    au FileType go nmap <leader>cd :GoLint<CR>

    au FileType go nmap <silent> <buffer> [[ :call GotoNext_Golang()<CR>
    au FileType go nmap <silent> <buffer> ]] :call GotoPrev_Golang()<CR>
augroup end

func! GotoNext_Golang()
    call search('^\s*\(func\|t.Run\|func Test\)', 'b')
    nohlsearch
    " normal zt
endfunc!

func! GotoPrev_Golang()
    call search('^\s*\(func\|t.Run\|func Test\)', '')
    nohlsearch
    " normal zt
endfunc!
