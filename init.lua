require("plugins")
require("remaps")

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	color_overrides = {
		mocha = {
			green = "#F9E2AF",
			teal = "#F5E0DC",
		},
	},
})
vim.cmd [[
	silent! colorscheme catppuccin-mocha
]]

-- vim.cmd.colorscheme "everforest"
-- vim.o.termguicolors = false
-- vim.cmd [[
-- 	silent! colorscheme catppuccin-mocha
-- 	hi Normal ctermbg=none
-- 	hi NormalNC ctermbg=none
-- 	hi NormalSB ctermbg=none
-- 	hi NonText ctermbg=none
-- 	hi Normal guibg=none
-- 	hi NormalNC guibg=none
-- 	hi NormalSB guibg=none
-- 	hi NonText guibg=none
-- ]]

-- vim settings
local set = vim.opt

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.relativenumber = true
set.number = true

set.splitright = true
