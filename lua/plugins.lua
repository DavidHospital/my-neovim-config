vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.2',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }
	use 'nvim-treesitter/playground'

	use { "catppuccin/nvim", as = "catppuccin" }

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

--	use {
--		'hrsh7th/cmp-nvim-lsp',
--		'windwp/nvim-autopairs',
--	}
end)


