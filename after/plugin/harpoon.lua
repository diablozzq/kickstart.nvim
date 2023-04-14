local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
local tmux = require("harpoon.tmux")

local function get_reg(char)
    -- removes new lines and replaces with character
    -- return vim.api.nvim_exec([[echo getreg(']] .. char .. [[')]], true):gsub("[\n\r]", "^J")
    return vim.api.nvim_exec([[echo getreg(']] .. char .. [[')]], true)
end

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<leader><tab>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

vim.keymap.set("n", "<leader>t", function() tmux.gotoTerminal(1) end)
vim.keymap.set("n", "<leader>pt", function()
    tmux.sendCommand(1, get_reg('+'))
    tmux.gotoTerminal(1)
end)
vim.keymap.set("n", "<leader>pr", function()
    tmux.sendCommand(1, "RUST_LOG=info cargo run[\n\r]")
    tmux.gotoTerminal(1)
end)
