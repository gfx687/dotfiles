set termguicolors
set cursorline

function! Ishan9299_solarized_light()
    colorscheme solarized
    hi SignColumn guibg=#eee8d5
    hi IncSearch cterm=reverse ctermfg=178 gui=reverse guifg=#2aa198
    hi CursorLineNr guifg=#fdf6e3 guibg=#b58900
    " hi CursorLineNr guifg=#fdf6e3 guibg=#268bd2
endfunction

if $BACKGROUND == "light"
    set background=light

    " exec Ishan9299_solarized_light()
    colorscheme tokyonight-day

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
