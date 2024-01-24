" TODO:
" 1) EasyAlign - dont add spaces around delimiter
" 2) auto-completion of react components in JSX adds '()' after component name
"    inside HTML tags

call plug#begin('~/.vim/plugged')
Plug 'gfx687/catppuccin-nvim', { 'as': 'catppuccin', 'branch': 'lightline-fix' }
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ishan9299/nvim-solarized-lua'
Plug 'itchyny/lightline.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
    nnoremap <leader>gs :Git<Cr>
    nnoremap <leader>gb :Git blame<Cr>
    nnoremap <leader>gd :Gdiffsplit<Cr>
Plug 'lewis6991/gitsigns.nvim'
    nnoremap <leader>gl :Gitsigns preview_hunk<Cr>
    nnoremap <leader>g[ :Gitsigns prev_hunk<Cr>
    nnoremap <leader>g] :Gitsigns next_hunk<Cr>

Plug 'preservim/nerdtree'
    let g:NERDTreeWinPos = 'left'
    let NERDTreeShowHidden=1
    let NERDTreeQuitOnOpen=0
    let g:NERDTreeWinSize=40

    map <leader>nn :NERDTreeToggle<cr>
    map <leader>nf :NERDTreeFind<cr>

Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
    let g:db_ui_execute_on_save=0
Plug 'tpope/vim-dispatch'              " `<CR> `<Space> :Dispatch :Copen
Plug 'norcalli/nvim-colorizer.lua'     " :ColorizerToggle
Plug 'tpope/vim-commentary'            " gc + text object to comment
" Plug 'preservim/vim-markdown'          " covered by treesitter it seems
Plug 'preservim/tagbar'
    nmap <F8> :TagbarToggle<CR>
    let g:tagbar_wrap=0

Plug 'windwp/nvim-autopairs'
" Plug 'jiangmiao/auto-pairs'
Plug 'wellle/targets.vim'              " more text objects
" Plug 'gfx687/vim-ski'
    let g:skeletons_dir=$HOME . '/dotfiles/vimrc.d/skeletons/'

" gaip= to align by first =, gaip-1= - by last, gaip*= by all
" gaip + CTRL-X for regexp
Plug 'junegunn/vim-easy-align'
    xmap ga <Plug>(EasyAlign)
    nmap ga <Plug>(EasyAlign)

Plug 'nvim-lua/plenary.nvim'
Plug 'dstein64/vim-startuptime'
Plug 'folke/which-key.nvim'
Plug 'folke/todo-comments.nvim'
" Plug 'RRethy/vim-illuminate'           " highling word under cursor
Plug 'easymotion/vim-easymotion'       " <leader> <leader> f / w
Plug 'reedes/vim-lexical'              " spell-checking, [s ]s <leader>s zg zug
    let g:lexical#spell_key = '<leader>s'
    let g:lexical#thesaurus_key = '<leader>t'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'markonm/traces.vim'              " substitute highlighting
" Plug 'tpope/vim-surround'              " visual + S + surrounder
Plug 'echasnovski/mini.surround'       " s + a(dd) / d(elete) / r(eplace)
Plug 'bronson/vim-trailing-whitespace' " :FixWhitespace

Plug 'fatih/vim-go'
    let g:go_def_mapping_enabled = 0
" Plug 'OmniSharp/omnisharp-vim'

" javascript
" Plug 'styled-components/vim-styled-components'
" Plug 'pangloss/vim-javascript'
Plug 'yuezk/vim-js'
" Plug 'HerringtonDarkholme/yats.vim'
Plug 'MaxMEllon/vim-jsx-pretty'
call plug#end()

" :vim-lexical
augroup lexical
    autocmd!
    autocmd FileType markdown,mkd call lexical#init()
augroup END

lua << EOF
require'which-key'.setup {
  window = {
    border = "single"
  }
}

require'nvim-autopairs'.setup()

require'mini.surround'.setup {
    search_method = 'cover_or_next'
}

require('gitsigns').setup()

require'todo-comments'.setup {
  merge_keywords = false,
  keywords = {
    FIX = {
      icon = " ", -- icon used for the sign, and in search results
      color = "error", -- can be a hex color, or a named color (see below)
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
    },
    TODO = { icon = " ", color = "info" },
    HACK = { icon = " ", color = "warning" },
    WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
    PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
  },
  search = {
    command = "rg",
    args = {
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--glob=!node_modules",
      "--glob=!.git"
    },
    -- pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
  },
}
EOF
