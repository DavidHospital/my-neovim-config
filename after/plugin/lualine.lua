local custom_theme = require('lualine.themes.everforest')
custom_theme.normal.c.bg = 'none'
custom_theme.inactive.c.bg = 'none'

require('lualine').setup {
	options = {
		icons_enabled = true,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		theme = custom_theme,
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
		},
	}
}
