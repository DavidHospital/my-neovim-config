local lsp = require('lsp-zero').preset({})
lsp.ensure_installed({
	'rust_analyzer',
})

lsp.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp.default_keymaps({buffer = bufnr})
end)

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = {
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = false}),

		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),

		['k'] = cmp.mapping.select_prev_item(cmp_action),
		['j'] = cmp.mapping.select_next_item(cmp_action),
	},
})
---cmp.register_source('nvim_lsp_signature_help')

