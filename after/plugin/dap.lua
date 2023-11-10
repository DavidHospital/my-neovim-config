local dap, dapui = require("dap"), require("dapui")
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
end

vim.keymap.set('n', '<leader>duc', dapui.close)
vim.keymap.set('n', '<leader>duo', dapui.open)

vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>dl', function()
	dap.list_breakpoints();
	vim.cmd("copen");
end)
vim.keymap.set('n', '<leader>dc', dap.clear_breakpoints)
vim.keymap.set('n', '<leader>dr', dap.repl.open)

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F6>', dap.terminate)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)

require('dap-python').setup('~/work/.virtualenvs/debugpy/bin/python')
require('dap-python').test_runner = 'pytest'

vim.keymap.set('n', '<leader>dm', require'dap-python'.test_method)

