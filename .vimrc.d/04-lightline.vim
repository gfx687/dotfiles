let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'readonly', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'gitbranch', 'fileencoding', 'filetype' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'LightlineGitbranch',
  \   'fileencoding': 'LightlineFileencoding',
  \ },
  \ }

" show only if not utf-8
function! LightlineFileencoding() abort
  return &fileencoding ==# 'utf-8' ? '' : (&fileencoding ==# '' ? 'no ft' : &fileencoding)
endfunction

function! LightlineGitbranch() abort
  if exists("*FugitiveHead")
    return fugitive#head() ==# '' ? '' : ' ' . fugitive#head()
  endif
  return ''
endfunction

if $THEME == "onelight"
  let g:lightline.colorscheme = 'one'
endif

if $THEME == "nord"
  let g:lightline.colorscheme = 'nord'
endif

if $THEME == "gruvbox"
  let g:lightline.colorscheme = 'gruvbox'
endif
