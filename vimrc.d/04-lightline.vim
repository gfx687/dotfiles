" TODO and Known Issues
" 1) configure catppuccin theme
"    change color of lightle background to slightly darker gray
"    change line / column number color

let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'readonly', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'gitbranch', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'fileencoding': 'LightlineFileencoding',
  \ },
  \ }

" show only if not utf-8
function! LightlineFileencoding() abort
  return &fileencoding ==# 'utf-8' ? '' : (&fileencoding ==# '' ? 'no ft' : &fileencoding)
endfunction

if $BACKGROUND == "light"
    let g:lightline.colorscheme = 'catppuccin'
else
    let g:lightline.colorscheme = 'dracula'
endif
