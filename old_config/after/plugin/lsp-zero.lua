local lsp = require('lsp-zero').preset({})

lsp.set_preferences({
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

vim.diagnostic.config({
    virtual_text = true
})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        { buffer = bufnr, remap = false, desc = 'Visual buffer workspace symbol' })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end,
        { buffer = bufnr, remap = false, desc = 'Visual buffer references' })
end)

-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    --mapping = cmp.mapping.preset.insert {
    --['<C-f>'] = cmp_action.luasnip_jump_forward(),
    --['<C-b>'] = cmp_action.luasnip_jump_backward(),
    --['<Tab>'] = nil,
    --['<S-Tab>'] = nil,
    --},
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'nvim_lsp_signature_help' },
    },
})
