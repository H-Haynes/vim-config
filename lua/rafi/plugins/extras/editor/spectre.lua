return {

	-- Find the enemy and replace them with dark power
	{
		'nvim-pack/nvim-spectre',
		-- stylua: ignore
		keys = {
			{ '<Leader>sp', function() require('spectre').toggle() end, desc = '搜索替换', },
			{ '<Leader>sp', function() require('spectre').open_visual({ select_word = true }) end, mode = 'x', desc = '搜索替换单词' },
		},
		opts = {
			open_cmd = 'noswapfile vnew',
			mapping = {
				['toggle_gitignore'] = {
					map = 'tg',
					cmd = "<cmd>lua require('spectre').change_options('gitignore')<CR>",
					desc = '切换 gitignore 规则',
				},
			},
			find_engine = {
				['rg'] = {
					cmd = 'rg',
					args = {
						'--pcre2',
						'--color=never',
						'--no-heading',
						'--with-filename',
						'--line-number',
						'--column',
						'--ignore',
					},
					options = {
						['gitignore'] = {
							value = '--no-ignore',
							icon = '[G]',
							desc = '遵循 gitignore',
						},
					},
				},
			},
			default = {
				find = {
					cmd = 'rg',
					options = { 'ignore-case', 'hidden', 'gitignore' },
				},
			},
		},
	},
}
