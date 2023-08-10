vim.api.nvim_command([[
  autocmd BufEnter * lua
    if vim.fn.tabpagenr('$') == 1 and vim.fn.winnr('$') == 1 and vim.b.NERDTree and vim.b.NERDTree.isTabTree() then
      vim.cmd('quit')
    end
  ]]
)

vim.api.nvim_command([[
  map <F6> :NERDTreeToggle <CR>
]])
