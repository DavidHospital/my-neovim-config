vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", vim.cmd.Ex)


-- buffer keymaps
vim.keymap.set("n", "<C-j>", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<C-k>", "<Cmd>bprev<CR>")

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
