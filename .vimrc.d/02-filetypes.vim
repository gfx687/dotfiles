augroup _sh_filetype
  au!
  au BufRead,BufNewFile */bin/* set ft=sh
augroup end

augroup _codestyle
  au!
  au FileType python setlocal ts=2 sts=2 sw=2 expandtab
augroup end
