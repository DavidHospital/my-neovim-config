vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    
    use { "catppuccin/nvim", as = "catppuccin" }
    use {
	    'nvim-telescope/telescope.nvim', tag = '0.1.2',
	    -- or                            , branch = '0.1.x',
	    requires = { {'nvim-lua/plenary.nvim'} }
    }
end)

