local neotest = require("neotest")
neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
		}),
		require("neotest-rust") {
			dap_adapter = "lldb",
		},
	},
})

vim.keymap.set("n", "<leader>ts", neotest.summary.toggle, { desc = "Toggle summary view" })
vim.keymap.set("n", "<leader>tr", neotest.run.run, { desc = "Run nearest test" })
vim.keymap.set("n", "<leader>td", function()
	neotest.run.run({ strategy = "dap" })
end, { desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>to", function()
	neotest.output.open({ enter = true, short = true })
end, { desc = "Open test output" })
