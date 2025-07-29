require("no-neck-pain").setup({
	buffers = {
		right = {
			enabled = false,
		},
	},
	minSideBufferWidth = 40,
	autocmds = {
		enableOnVimEnter = true,
		skipEnteringNoNeckPainBuffer = true,
	},
})
