augroup Other_ft
  au!
  au BufRead,BufNewFile */bin/* set ft=sh
augroup end

augroup Python_ft
  au!
  au FileType python setlocal ts=4 sts=4 sw=4 expandtab
  au FileType python nmap <leader>r :call ExecInTmuxSplit('python3 ' . expand('%:p'))<CR>
augroup end

augroup Rust_ft
  au!

  au FileType rust nmap <leader>r :call ExecInTmuxSplit('cargo run ' . expand('%:p'))<CR>
augroup end

augroup Markdown_ft
    au!

    au Syntax markdown normal zR
augroup end
