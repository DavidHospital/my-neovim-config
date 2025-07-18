local neotest = require("neotest")
neotest.setup({
  adapters = {
    require("neotest-rust") {
		dap_adapter = "lldb",
	}
  }
})

vim.keymap.set("n", "<leader>ts", neotest.summary.toggle)
vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({enter = true})
end)
