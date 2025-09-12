require("no-neck-pain").setup({
	buffers = {
		right = {
			enabled = false,
		},
		left = {
			scratchPad = {
				enabled = true,
				pathToFile = "~/.scratchpads/" .. vim.fn.fnamemodify(vim.loop.cwd(), ":t") .. ".norg",
			},
		},
	},
	minSideBufferWidth = 40,
	autocmds = {
		enableOnVimEnter = true,
		skipEnteringNoNeckPainBuffer = true,
	},
})
