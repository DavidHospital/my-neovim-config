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

	use 'tpope/vim-fugitive'

	use { "catppuccin/nvim", as = "catppuccin" }
	use { "rebelot/kanagawa.nvim", as = "kanagawa" }

	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}

	use {
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'hrsh7th/vim-vsnip',
		'hrsh7th/cmp-vsnip',
	}
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use 'terrortylor/nvim-comment'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' }
	}
	use {
		'akinsho/bufferline.nvim', tag = "*", 
		requires = 'nvim-tree/nvim-web-devicons'
	}

	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
end)


