" TODO and Known Issues
" comment color is too light, change it to more readable

set termguicolors
set cursorline

if $BACKGROUND == "light"
    set background=light

lua << EOF
        require("catppuccin").setup({
            no_underline = true
        })

        vim.cmd.colorscheme "catppuccin-latte"
EOF

    hi CursorLine guibg=#dddddd
else
    set background=dark
    colorscheme dracula
    let g:dracula_italic = 0
endif

