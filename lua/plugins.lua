vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.3',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use { 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'} }
	use 'nvim-treesitter/playground'

	use 'ThePrimeagen/harpoon'

	use 'tpope/vim-fugitive'

	use { "catppuccin/nvim", as = "catppuccin" }
	use { "rebelot/kanagawa.nvim", as = "kanagawa" }
	use { "sainnhe/everforest", as = "everforest" }

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

	use 'mfussenegger/nvim-dap'
	use 'mfussenegger/nvim-dap-python'
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }

	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}

	use 'terrortylor/nvim-comment'

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons' }
	}

	use({
		"iamcco/markdown-preview.nvim",
		run = function() vim.fn["mkdp#util#install"]() end,
	})
end)


