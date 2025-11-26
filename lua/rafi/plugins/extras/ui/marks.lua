return {

	-- Interacting with and manipulating marks
	{
		'chentoast/marks.nvim',
		event = 'FileType',
		-- stylua: ignore
		keys = {
			{ 'm/', '<cmd>MarksListAll<CR>', desc = '所有已打开缓冲区的标记' },
		},
		opts = {
			sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
			bookmark_1 = { sign = '󰈼' }, -- ⚐ ⚑ 󰈻 󰈼 󰈽 󰈾 󰈿 󰉀
			mappings = {
				annotate = 'm<Space>',
			},
		},
	},
}
