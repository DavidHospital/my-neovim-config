require('lualine').setup {
	options = {
		icons_enabled = true,
		component_separators = { left = '', right = ''},
		section_separators = { left = '', right = ''},
		theme = 'auto',
	},
	sections = {
		lualine_c = {
			{
				'filename',
				path = 1
			}
		}
	}
}
