vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.termguicolors = true

vim.cmd [[highlight IndentBlanklineIndent1 guibg=#000000 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guibg=#1a1a1a gui=nocombine]]

vim.cmd [[highlight Grey guifg=#706f6f gui=nocombine]]

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    -- char = "",
    --char_highlight_list = {
        --"IndentBlanklineIndent1",
        --"IndentBlanklineIndent2",
    --},
    space_char_blankline = " ",
    char_highlight_list = {
      "Grey"
    },
    --space_char_highlight_list = {
        --"IndentBlanklineIndent1",
        --"IndentBlanklineIndent2",
    --},
    show_trailing_blankline_indent = false,
}
