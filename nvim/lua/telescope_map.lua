local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {})

require("telescope").setup({
	defaults = {
		preview = {
			-- Hook to scroll to last line after preview is loaded
			preview_hook = function(filepath, bufnr, opts)
				vim.schedule(function()
					if vim.api.nvim_buf_is_valid(bufnr) then
						vim.api.nvim_win_set_cursor(0, { vim.api.nvim_buf_line_count(bufnr), 0 })
					end
				end)
			end,
		},
		file_ignore_patterns = {
			".git/",
		},
	},
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})

-- Make Telescope backgrounds transparent AFTER colorscheme & telescope load
local function telescope_transparent()
  local groups = {
    "TelescopeNormal",
    "TelescopeBorder",
    "TelescopePromptNormal",
    "TelescopePromptBorder",
    "TelescopeResultsNormal",
    "TelescopeResultsBorder",
    "TelescopePreviewNormal",
    "TelescopePreviewBorder",
    "TelescopePromptTitle",
    "TelescopeResultsTitle",
    "TelescopePreviewTitle",
    "TelescopeNormalFloat",
  }

  for _, group in ipairs(groups) do
    pcall(vim.api.nvim_set_hl, 0, group, { bg = "NONE", ctermbg = "NONE" })
  end
end

-- Reapply highlight overrides after colorscheme loads
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = telescope_transparent,
})

-- Reapply after telescope loads (important for lazy loading)
vim.api.nvim_create_autocmd("User", {
  pattern = "TelescopeLoaded",
  callback = telescope_transparent,
})

-- Also call once now if everything is already loaded
telescope_transparent()
