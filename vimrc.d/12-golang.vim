augroup Golang_ft
  au!
  " au FileType go setlocal ts=4 sts=4 sw=4 noexpandtab
  au FileType go setlocal cc=80

  au FileType go nmap <silent> <buffer> [[ :call Go_prev_func()<CR>
  au FileType go nmap <silent> <buffer> ]] :call Go_next_func()<CR>
augroup end

func! Go_prev_func()
    call search('^\(func\|type\|var\) ', 'b')
    nohlsearch
endfunc!

func! Go_next_func()
    call search('^\(func\|type\|var\) ', '')
    nohlsearch
endfunc!
