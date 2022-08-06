require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules/.*"
		}
	}
}

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

-- Builtin
map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files()<CR>', options)
map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
map('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
map('n', '<leader>fb', '<CMD>lua require("telescope.builtin").buffers()<CR>', options)
map('n', '<leader>fh', '<CMD>lua require("telescope.builtin").help_tags()<CR>', options)
map('n', '<leader>fd', '<CMD>lua require("telescope.builtin").diagnostics()<CR>', options)
map('n', '<leader>fr', '<CMD>lua require("telescope.builtin").registers()<CR>', options)
