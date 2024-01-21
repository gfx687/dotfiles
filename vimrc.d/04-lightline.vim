" TODO and Known Issues
" 1) Add info about vim-lexical typos to the status line

autocmd User CocDiagnosticChange call lightline#update()

let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'filename', 'readonly', 'modified' ] ],
  \   'right': [ [ 'lineinfo' ],
  \              [ 'percent' ],
  \              [ 'gitbranch', 'fileencoding', 'cocstatus' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'GitBranch',
  \   'fileencoding': 'LightlineFileencoding',
  \   'filename': 'RelativeFilename',
  \ },
  \ 'component_expand': {
  \   'cocstatus': 'CocStatus'
  \ },
  \ 'component_type': {
  \   'cocstatus': 'error'
  \ }
  \ }

" show only if not utf-8
function! LightlineFileencoding() abort
  return &fileencoding ==# 'utf-8' ? '' : (&fileencoding ==# '' ? 'no ft' : &fileencoding)
endfunction

function! RelativeFilename()
  return expand('%')
endfunction

function! CocStatus() abort
  let info = get(b:, 'coc_diagnostic_info', {})
  if empty(info) | return '' | endif
  let msgs = []
  " if get(info, 'hint', 0)
  "   call add(msgs, 'Hint: ' . info['hint'])
  " endif
  if get(info, 'information', 0)
    call add(msgs, 'Inf: ' . info['information'])
  endif
  if get(info, 'error', 0)
    call add(msgs, 'Err: ' . info['error'])
  endif
  if get(info, 'warning', 0)
    call add(msgs, 'Wrn: ' . info['warning'])
  endif
  return join(msgs, ' | ')
endfunction

function! GitBranch()
    return ' ' . FugitiveHead()
endfunction

if $BACKGROUND == "light"
    " let g:lightline.colorscheme = 'catppuccin'
    let g:lightline.colorscheme = 'solarized'
else
    let g:lightline.colorscheme = 'dracula'
endif

