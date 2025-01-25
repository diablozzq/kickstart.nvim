local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>sz', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = 'Search grep then fu[Z]zy' })
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles,
	{ desc = '[?] [S]earch Recently [O]pened files' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = "[S]earch [K]ey maps" })
