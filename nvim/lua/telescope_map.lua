local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fo', builtin.oldfiles, {})

require('telescope').setup{ 
  defaults = { 
    preview = {
      -- Hook to scroll to last line after preview is loaded
      preview_hook = function(filepath, bufnr, opts)
        vim.schedule(function()
          if vim.api.nvim_buf_is_valid(bufnr) then
            vim.api.nvim_win_set_cursor(0, {vim.api.nvim_buf_line_count(bufnr), 0})
          end
        end)
      end
    },
    file_ignore_patterns = { 
      ".git/",
    }
  },
  pickers = {
    find_files = {
      hidden = true,
    }
  }
}
