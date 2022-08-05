require('telescope').setup {
	defaults = {
		file_ignore_patterns = {
			"node_modules/.*"
		}
	}
}

local map = vim.api.nvim_set_keymap
local options = { noremap = true }

map('n', '<leader>fg', '<CMD>lua require("telescope.builtin").git_files{}<CR>', options)
map('n', '<leader>ff', '<CMD>lua require("telescope.builtin").find_files{ hidden = true }<CR>', options)
map('n', '<leader>fl', '<CMD>lua require("telescope.builtin").live_grep()<CR>', options)
