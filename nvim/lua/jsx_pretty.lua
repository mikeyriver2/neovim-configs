vim.g.jsx_ext_required = 0
vim.g.jsx_pretty_highlight_close_tag = 1
vim.g.jsx_pretty_highlight_tags = { 'CustomTag', 'AnotherCustomTag' }
vim.cmd([[
  autocmd FileType typescriptreact setlocal formatexpr=vim.fn['vimjsx#prettier#format']()
]])
