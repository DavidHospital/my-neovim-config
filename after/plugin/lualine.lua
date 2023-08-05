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
				'buffers',
				mode = 0,
				buffers_color = {
					active = 'lualine_a_normal'
				},
				icons_enabled = false,

				--general
				separator = '',
				draw_empty = true,
			}
		}
	}
}
