" TODO:
" 1) Add info about vim-lexical typos to the status line
" 2) TODOs in project - https://github.com/folke/todo-comments.nvim/issues/197

autocmd User CocDiagnosticChange call lightline#update()

augroup lightline-events
    autocmd!
    autocmd ColorScheme * call s:onColorSchemeChange(expand("<amatch>"))
augroup END

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

let s:colour_scheme_map = {
    \ 'tokyonight-day': 'tokyonight',
    \ 'tokyonight-moon': 'tokyonight',
    \ 'tokyonight-night': 'tokyonight',
    \ 'tokyonight-storm': 'tokyonight',
    \ 'catppuccin-latte': 'catppuccin',
    \ 'catppuccin-mocha': 'catppuccin',
    \ 'catppuccin-frappe': 'catppuccin',
    \ 'catppuccin-mochiato': 'catppuccin'
    \ }

function! s:onColorSchemeChange(scheme)
    " Try a scheme provided already
    execute 'runtime autoload/lightline/colorscheme/'.a:scheme.'.vim'
    if exists('g:lightline#colorscheme#{a:scheme}#palette')
        let g:lightline.colorscheme = a:scheme
    else  " Try falling back to a known colour scheme
        let l:colors_name = get(s:colour_scheme_map, a:scheme, '')
        if empty(l:colors_name)
            return
        else
            let g:lightline.colorscheme = l:colors_name
        endif
    endif
    call lightline#init()
    call lightline#colorscheme()
    call lightline#update()
endfunction
