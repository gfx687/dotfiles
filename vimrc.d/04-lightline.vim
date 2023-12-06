" TODO and Known Issues
" 1) Add info about vim-lexical typos to the status line

let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'readonly', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'gitbranch', 'fileencoding' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'fileencoding': 'LightlineFileencoding',
  \   'filename': 'RelativeFilename',
  \ },
  \ }

" show only if not utf-8
function! LightlineFileencoding() abort
  return &fileencoding ==# 'utf-8' ? '' : (&fileencoding ==# '' ? 'no ft' : &fileencoding)
endfunction

function! RelativeFilename()
  return expand('%')
endfunction

if $BACKGROUND == "light"
    let g:lightline.colorscheme = 'catppuccin'

    " let g:lightline#colorscheme#catppuccin#palette.normal.middle = [ [ '#ff0000', '#ff0000', '#ff0000', '#ff0000' ] ]
else
    let g:lightline.colorscheme = 'dracula'
endif

