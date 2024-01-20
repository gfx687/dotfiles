set termguicolors
set cursorline

if $BACKGROUND == "light"
    set background=light

    colorscheme solarized

    " catppuccin latte
" lua << EOF
"     require("catppuccin").setup({
"         no_underline = true,
"         color_overrides = {
"             latte = {
"                 --base = "#fdf6e3" -- solarized light background
"             },
"         }
"     })
"     vim.cmd.colorscheme "catppuccin-latte"
" EOF
"     hi CursorLine guibg=#dddddd
else
    set background=dark
    colorscheme dracula
    let g:dracula_italic = 0
endif
