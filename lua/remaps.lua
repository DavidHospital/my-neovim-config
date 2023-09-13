vim.g.mapleader = " "

vim.keymap.set("n", "<leader>D", vim.cmd.Ex)

-- center screen after some motions
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "gd", "gdzz")

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- copy paste to * and + registers
vim.keymap.set('n', "<leader>y", "\"*y")
vim.keymap.set('n', "<leader>Y", "\"+y")
vim.keymap.set('n', "<leader>p", "\"*p")
vim.keymap.set('n', "<leader>P", "\"*P")
