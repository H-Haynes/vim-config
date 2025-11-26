return {

	-- Fast Neovim http client written in Lua
	{
		'rest-nvim/rest.nvim',
		main = 'rest-nvim',
		ft = 'http',
		cmd = 'Rest',
		keys = {
			{ '<Leader>ch', '<cmd>Rest run<CR>', desc = '执行 HTTP 请求' },
		},
		opts = { skip_ssl_verification = true },
	},
}
