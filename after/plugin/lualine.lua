require('lualine').setup {
	options = {
		icons_enabled = true,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		theme = 'auto',
	},
	sections = {
		lualine_b = {
			{
				'filename',
				path = 1
			}
		},
		lualine_c = {
			{
				'branch'
			},
			{
				'diff'
			},
			{
				'diagnostics'
			}
		}
	}
}
