set foldcolumn=0
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

lua << EOF
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "typescript", "tsx", "go", "python" },

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  highlight = {
    enable = true,
--     disable = { "go" },

    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
};

-- Markdown
vim.api.nvim_set_hl(0, "@text.title.1.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.1.marker.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.2.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.2.marker.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.3.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.3.marker.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.4.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.4.marker.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.5.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.5.marker.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.6.markdown", { link = "MarkdownHeader" })
vim.api.nvim_set_hl(0, "@text.title.6.marker.markdown", { link = "MarkdownHeader" })

EOF
