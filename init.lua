require("plugins")
require("remaps")

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = true,
	color_overrides = {
		mocha = {
			green = "#F9E2AF",
			teal = "#F4DBD6",
			surface1 = "#9CA0B0",
			overlay0 = "#8C8FA1",
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

-- pretty print json file
vim.api.nvim_create_user_command("JqFormat", function()
	vim.cmd("silent! %!jq .")
	vim.bo.filetype = "json"
end, { nargs = 0 })
