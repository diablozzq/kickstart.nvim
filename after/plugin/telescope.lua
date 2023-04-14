local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Search git files traditional shortcut' })
vim.keymap.set('n', '<leader>si', builtin.git_files, { desc = '[S]earch g[I]t files' })
vim.keymap.set('n', '<C-S-p>', builtin.commands, { desc = 'Search commands traditional shortcut' })
vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>sh', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Search grep then fuzzy' })
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>sr', require('telescope.builtin').oldfiles,
	{ desc = '[?] [S]earch [R]ecently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Search existing buffers' })
vim.keymap.set('n', '<leader>/', function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
		winblend = 10,
		previewer = false,
	})
end, { desc = '[/] Search in current buffer' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "[S]earch [K]ey maps" })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
