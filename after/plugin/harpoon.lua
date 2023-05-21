local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local tmux = require("harpoon.tmux")

local function get_reg(char)
    -- removes new lines and replaces with character
    -- return vim.api.nvim_exec([[echo getreg(']] .. char .. [[')]], true):gsub("[\n\r]", "^J")
    return vim.api.nvim_exec([[echo getreg(']] .. char .. [[')]], true)
end

vim.keymap.set("n", "<leader>m", mark.add_file, { desc = 'Harpoon add file' })
vim.keymap.set("n", "<leader><tab>", ui.toggle_quick_menu, { desc = 'Harpoon quick menu' })

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = 'Harpoon file 1' })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = 'Harpoon file 2' })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = 'Harpoon file 3' })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = 'Harpoon file 4' })

vim.keymap.set("n", "<leader>tt", function() tmux.gotoTerminal(1) end, { desc = 'Terminal open' })
vim.keymap.set("n", "<leader>tp", function()
    tmux.sendCommand(1, get_reg('+'))
    tmux.gotoTerminal(1)
end, { desc = 'Terminal paste' })
vim.keymap.set("n", "<leader>tr", function()
    tmux.sendCommand(1, "RUST_LOG=info cargo run\n\r")
    tmux.gotoTerminal(1)
end, { desc = 'Terminal cargo run' })
