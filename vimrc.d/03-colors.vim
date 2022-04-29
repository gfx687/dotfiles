if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if $THEME == "onelight"
  colorscheme one
  set background=light

  function SetupColorscheme() abort
    let s:pallete = g:lightline#colorscheme#one#palette
    let s:pallete.normal.middle = [ [ '#494b53', 'NONE', '238', 'NONE' ] ]
    let s:pallete.tabline.middle = [ [ '#494b53', 'NONE', '238', 'NONE' ] ]
    let s:pallete.tabline.tabsel[0][1] = '#98c379'
    let s:pallete.tabline.tabsel[0][3] = 'NONE'
    call lightline#colorscheme()
  endfunction
endif

if $THEME == "nord"
  colorscheme nord
  set background=dark

  function SetupColorscheme() abort
  endfunction
endif

if $THEME == "gruvbox"
  colorscheme gruvbox
  set background=dark

  function SetupColorscheme() abort
    let g:lightline.colorscheme = 'nord'
  endfunction
endif

autocmd VimEnter * call SetupColorscheme()

