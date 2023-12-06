" TODO and Known Issues
" comment color is too light, change it to more readable

set termguicolors
set cursorline

if $BACKGROUND == "light"
    set background=light
    colorscheme catppuccin-latte
    hi CursorLine guibg=#dddddd
else
    set background=dark
    colorscheme dracula
    let g:dracula_italic = 0
endif
