local lsp = require('lsp-zero').preset({})

lsp.preset("recommended")

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.ensure_installed({
	'rust-analyzer',
})
lsp.setup()
