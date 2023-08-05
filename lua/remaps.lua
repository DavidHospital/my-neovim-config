vim.g.mapleader = " "

vim.keymap.set("n", "<leader>d", vim.cmd.Ex)


-- buffer keymaps
vim.keymap.set("n", "<C-j>", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<C-k>", "<Cmd>bprev<CR>")
