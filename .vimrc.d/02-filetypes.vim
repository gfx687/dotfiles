augroup Other_ft
  au!
  au BufRead,BufNewFile */bin/* set ft=sh
augroup end

augroup Python_ft
  au!
  au FileType python setlocal ts=4 sts=4 sw=4 expandtab
  au FileType python nmap <leader>r :call ExecInTmuxSplit('python3 ' . expand('%:p'))<CR>
augroup end

augroup Javascript_ft
  au!
  " properly indent jsx
  au FileType typescriptreact,javascriptreact inoremap <C-Y><Cr> <C-O>i<CR><ESC>O
  " refactor tag to have it's content on it's own line
  au FileType typescriptreact,javascriptreact nmap <c-y><cr> vit"9xi<c-y><cr><c-r>9<esc>
augroup end
