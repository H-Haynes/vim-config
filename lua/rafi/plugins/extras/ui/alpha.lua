return {

	{ 'nvimdev/dashboard-nvim', optional = true, enabled = false },
	{ 'nvim-mini/mini.starter', optional = true, enabled = false },
	{
		'folke/persistence.nvim',
		opts = { autoload = false },
	},

	-- Fast and fully programmable greeter dashboard
	{
		'goolord/alpha-nvim',
		event = 'VimEnter',
		enabled = true,
		init = false,
		opts = function()
			local dashboard = require('alpha.themes.dashboard')
			local theta = require('alpha.themes.theta')
			local cdir = vim.fn.getcwd()
			-- stylua: ignore
			dashboard.section.buttons.val = {
				{
					type = 'group',
					val = {
						{
							type = 'text',
							val = '最近的文件',
							opts = {
								hl = 'SpecialComment',
								shrink_margin = false,
								position = 'center',
							},
						},
						{ type = 'padding', val = 1 },
						{
							type = 'group',
							val = function()
								return { theta.mru(0, cdir, 5) }
							end,
							opts = { shrink_margin = false },
						},
					},
				},
				{ type = 'padding', val = 2 },

				{ type = 'text', val = '快速链接', opts = { hl = 'SpecialComment', position = 'center' } },
				{ type = 'padding', val = 1 },
				dashboard.button('f', ' ' .. ' 查找文件',       LazyVim.pick()),
				dashboard.button('n', ' ' .. ' 新建文件',        [[<cmd> ene <BAR> startinsert <CR>]]),
				dashboard.button('r', ' ' .. ' 最近的文件',    LazyVim.pick('oldfiles')),
				dashboard.button('g', ' ' .. ' 查找文本',       LazyVim.pick('live_grep')),
				{ type = 'text', val = '-------', opts = { hl = 'Comment', position = 'center' } },
				dashboard.button('c', ' ' .. ' 配置',          LazyVim.pick.config_files()),
				dashboard.button('s', ' ' .. ' 恢复会话', [[<cmd> lua require('persistence').load() <CR>]]),
				dashboard.button('u', ' ' .. ' 更新插件' , '<cmd> Lazy sync <CR>'),
				dashboard.button('x', ' ' .. ' Lazy 扩展',     '<cmd> LazyExtras <CR>'),
				dashboard.button('l', '󰒲 ' .. ' Lazy 面板',       '<cmd> Lazy <CR>'),
				dashboard.button('q', ' ' .. ' 退出',            '<cmd> qa <CR>'),
				{ type = 'padding', val = 1 },
			}
			for _, button in ipairs(dashboard.section.buttons.val) do
				if button.on_press then
					button.opts.hl = 'AlphaButtons'
					button.opts.hl_shortcut = 'AlphaShortcut'
				end
			end
			dashboard.section.header.opts.hl = 'AlphaHeader'
			dashboard.section.buttons.opts.hl = 'AlphaButtons'
			dashboard.section.buttons.opts.spacing = 0
			dashboard.section.footer.opts.hl = 'AlphaFooter'
			return dashboard
		end,

		-- Credits: https://github.com/LazyVim/LazyVim
		config = function(_, dashboard)
			-- close Lazy and re-open when the dashboard is ready
			if vim.o.filetype == 'lazy' then
				vim.cmd.close()
				vim.api.nvim_create_autocmd('User', {
					once = true,
					pattern = 'AlphaReady',
					callback = function()
						require('lazy').show()
					end,
				})
			end

			require('alpha').setup(dashboard.opts)

			vim.api.nvim_create_autocmd('User', {
				once = true,
				pattern = 'LazyVimStarted',
				callback = function()
					local stats = require('lazy').stats()
					local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
					dashboard.section.footer.val = '⚡ Neovim 已加载 '
						.. stats.loaded
						.. '/'
						.. stats.count
						.. ' 个插件，用时 '
						.. ms
						.. ' 毫秒'
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
	},
}
