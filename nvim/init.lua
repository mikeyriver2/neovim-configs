vim.cmd('source ~/.config/nvim/config.vim')
require('plugins/lsp')
 --require('coc')
require('completions')
require('jsx_pretty')
require('telescope_map')
require('indenting')
require('gitconflict')
-- require('tree-sit')
require('lualine').setup()
require('trouble_diag')
require('treenerdy')
require('neogem')
require('lualoine')
require('nullls')
require('project')

-- Addlt maps that require most priv
vim.api.nvim_set_keymap('n', '<C-j>', ':tabprev<CR>', { noremap = true, silent = true })

-- Map <C-k> to switch to the next tab
vim.api.nvim_set_keymap('n', '<C-k>', ':tabnext<CR>', { noremap = true, silent = true })
