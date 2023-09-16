require("plugins")
require("remaps")

vim.cmd.colorscheme "tokyonight"
vim.cmd [[
	highlight Normal ctermbg=none
	highlight NormalNC ctermbg=none
	highlight Normal guibg=none
	highlight NormalNC guibg=none
]]

-- vim settings
local set = vim.opt

set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4

set.relativenumber = true
set.number = true

