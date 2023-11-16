set termguicolors
set cursorline

if $BACKGROUND == "light"
    set background=light
    colorscheme catppuccin-latte
    hi CursorLine term=reverse guibg=#ccd0da
else
    set background=dark
    colorscheme dracula
    let g:dracula_italic = 0
endif
