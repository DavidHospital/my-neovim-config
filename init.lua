require("plugins")
require("remaps")

vim.cmd.colorscheme "gruvbox"
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
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

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("NoNeckPain")
  end,
})
