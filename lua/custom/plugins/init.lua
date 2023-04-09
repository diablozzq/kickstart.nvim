-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	require '../../../kickstart.plugins.autoformat',
	require '../../../kickstart.plugins.debug',
}
--[[
	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {
				icons = false,
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			}
		end
	})

	use("nvim-treesitter/nvim-treesitter-context");

	use {
		'VonHeikemen/lsp-zero.nvim',

			-- Autocompletion
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-nvim-lua' },

			{ 'rafamadriz/friendly-snippets' },
		}
	}

	use("folke/zen-mode.nvim")
	use("github/copilot.vim")
	use("laytan/cloak.nvim")
--]]
