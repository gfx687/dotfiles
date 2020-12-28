augroup Other_ft
  au!
  au FileType python setlocal ts=2 sts=2 sw=2 expandtab
  au BufRead,BufNewFile */bin/* set ft=sh
augroup end

augroup Javascript_ft
  au!
  " properly indent jsx
  au FileType typescriptreact,javascriptreact inoremap <C-Y><Cr> <C-O>i<CR><ESC>O
  " refactor tag to have it's content on it's own line
  au FileType typescriptreact,javascriptreact nmap <c-y><cr> vit"9xi<c-y><cr><c-r>9<esc>
augroup end
