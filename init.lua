require("plugins")
require("remaps")

-- vim.cmd.colorscheme "everforest"
vim.cmd [[
	silent! colorscheme everforest
	hi Normal ctermbg=none
	hi NormalNC ctermbg=none
]]

-- vim settings
local set = vim.opt

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.relativenumber = true
set.number = true

