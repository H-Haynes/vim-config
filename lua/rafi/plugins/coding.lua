-- Plugins: Coding
-- https://github.com/rafi/vim-config

return {

	-----------------------------------------------------------------------------
	-- Code completion
	-- NOTE: This extends
	-- $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/plugins/extras/coding/blink.lua
	{
		'blink.cmp',
		optional = true,
		opts = {
			keymap = {
				['<C-j>'] = { 'select_next', 'fallback' },
				['<C-k>'] = { 'select_prev', 'fallback' },
				['<C-d>'] = { 'select_next', 'fallback' },
				['<C-u>'] = { 'select_prev', 'fallback' },
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Lightweight yet powerful formatter plugin
	-- NOTE: This extends
	-- $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/plugins/formatting.lua
	{
		'conform.nvim',
		-- stylua: ignore
		keys = {
			{ '<leader>cic', '<cmd>ConformInfo<CR>', silent = true, desc = '格式化信息' },
		},
	},

	-----------------------------------------------------------------------------
	-- Asynchronous linter plugin
	-- NOTE: This extends
	-- $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/plugins/linting.lua
	{
		'nvim-lint',
		keys = {
			{
				'<leader>cin',
				function()
					local linters = require('lint').linters[vim.bo.filetype]
					if linters then
						vim.notify(
							vim.inspect(linters),
							vim.log.levels.INFO,
							{ title = '当前检查器' }
						)
					else
						vim.notify(
							'当前文件类型没有配置检查器',
							vim.log.levels.WARN,
							{ title = '当前检查器' }
						)
					end
				end,
				silent = true,
				desc = '检查器信息',
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Fast and feature-rich surround actions
	{ import = 'lazyvim.plugins.extras.coding.mini-surround' },
	{
		'mini.surround',
		opts = {
			mappings = {
				add = 'sa', -- Add surrounding in Normal and Visual modes
				delete = 'ds', -- Delete surrounding
				find = 'gzf', -- Find surrounding (to the right)
				find_left = 'gzF', -- Find surrounding (to the left)
				highlight = 'gzh', -- Highlight surrounding
				replace = 'cs', -- Replace surrounding
				update_n_lines = 'gzn', -- Update `n_lines`
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Powerful line and block-wise commenting
	{
		'numToStr/Comment.nvim',
		dependencies = { 'JoosepAlviste/nvim-ts-context-commentstring' },
		-- stylua: ignore
		keys = {
			{ '<leader>V', '<Plug>(comment_toggle_blockwise_current)', mode = 'n', desc = '注释' },
			{ '<leader>V', '<Plug>(comment_toggle_blockwise_visual)', mode = 'x', desc = '注释' },
		},
		opts = function(_, opts)
			local ok, tcc =
				pcall(require, 'ts_context_commentstring.integrations.comment_nvim')
			if ok then
				opts.pre_hook = tcc.create_pre_hook()
			end
		end,
	},

	-----------------------------------------------------------------------------
	-- Split and join arguments
	{
		'nvim-mini/mini.splitjoin',
		-- stylua: ignore
		keys = {
			{ 'sj', '<cmd>lua MiniSplitjoin.join()<CR>', mode = { 'n', 'x' }, desc = '合并参数' },
			{ 'sk', '<cmd>lua MiniSplitjoin.split()<CR>', mode = { 'n', 'x' }, desc = '拆分参数' },
		},
		opts = {
			mappings = { toggle = '' },
		},
	},

	-----------------------------------------------------------------------------
	-- Trailing whitespace highlight and remove
	{
		'nvim-mini/mini.trailspace',
		event = { 'BufReadPost', 'BufNewFile' },
		-- stylua: ignore
		keys = {
			{ '<leader>cw', '<cmd>lua MiniTrailspace.trim()<CR>', desc = '清除空白' },
		},
		opts = {},
	},

	-----------------------------------------------------------------------------
	-- Perform diffs on blocks of code
	{
		'AndrewRadev/linediff.vim',
		cmd = { 'Linediff', 'LinediffAdd' },
		keys = {
			{ '<leader>mdf', ':Linediff<CR>', mode = 'x', desc = '行差异' },
			{ '<leader>mda', ':LinediffAdd<CR>', mode = 'x', desc = '添加行差异' },
			{ '<leader>mds', '<cmd>LinediffShow<CR>', desc = '显示行差异' },
			{ '<leader>mdr', '<cmd>LinediffReset<CR>', desc = '重置行差异' },
		},
	},
}
