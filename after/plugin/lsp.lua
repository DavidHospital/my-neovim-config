vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		-- Create your keybindings here...
		local opts = { buffer = event.buf }
		vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
		vim.keymap.set('n', 'gd', function()
			vim.lsp.buf.definition()
		end, opts)
		vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
		vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
		vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
		vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
		vim.keymap.set('n', '<space>wl', function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
		vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
		vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
		vim.keymap.set('n', '<space>f', function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end
})

require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'lua_ls',
		'rust_analyzer',
		'pyright',
		'ruff_lsp',
	}
})

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
lsp_capabilities.textDocument.completion.completionItem.snippetSupport = false

require('mason-lspconfig').setup_handlers({
	function(server_name)
		lspconfig[server_name].setup({
			capabilities = lsp_capabilities,
		})
	end,
})

require('lspconfig').pyright.setup {
	on_attach = on_attach,
	capabilities = lsp_capabilities,
	settings = {
		pyright = {
			autoImportCompletion = true,
		},
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = 'openFilesOnly',
				useLibraryCodeForTypes = true,
				typeCheckingMode = 'off',
			}
		}
	}
}

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require('lspconfig').ruff_lsp.setup {
  on_attach = on_attach,
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    }
  }
}

-- yaml-language-server settings
lspconfig.yamlls.setup {
	on_attach = on_attach,
	capabilities = lsp_capabilities,
	settings = {
		yaml = {
			customTags = {
				"!Equals sequence",
				"!FindInMap sequence",
				"!GetAtt",
				"!GetAZs",
				"!ImportValue",
				"!Join sequence",
				"!Ref",
				"!Select sequence",
				"!Split sequence",
				"!Sub",
				"!Sub sequence",
				"!If sequence",
			}
		}
	}
}

local cmp = require('cmp')
cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'vsnip' },
		{ name = 'nvim_lsp_signature_help' },
	}),
})

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
-- vim.api.nvim_create_autocmd('LspAttach', {
	--   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
	--   callback = function(ev)
		--     -- Enable completion triggered by <c-x><c-o>
		--     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
		--
		--     -- Buffer local mappings.
		--     -- See `:help vim.lsp.*` for documentation on any of the below functions
		--   end,
		-- })
