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

    ":GoImpl

augroup end
