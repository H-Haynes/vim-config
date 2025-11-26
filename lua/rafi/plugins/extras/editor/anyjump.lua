return {

	-- Jump to any definition and references without overhead
	{
		'pechorin/any-jump.vim',
		cmd = { 'AnyJump', 'AnyJumpVisual' },
		keys = {
			{ '<leader>ii', '<cmd>AnyJump<CR>', desc = '任意跳转' },
			{ '<leader>ii', '<cmd>AnyJumpVisual<CR>', mode = 'x', desc = '任意跳转' },
			{ '<leader>ib', '<cmd>AnyJumpBack<CR>', desc = '任意跳转返回' },
			{ '<leader>il', '<cmd>AnyJumpLastResults<CR>', desc = '任意跳转恢复' },
		},
		init = function()
			vim.g.any_jump_disable_default_keybindings = 1
			vim.api.nvim_create_autocmd('FileType', {
				group = vim.api.nvim_create_augroup('rafi.any-jump', {}),
				pattern = 'any-jump',
				callback = function()
					vim.opt.cursorline = true
				end,
			})
		end,
	},
}
