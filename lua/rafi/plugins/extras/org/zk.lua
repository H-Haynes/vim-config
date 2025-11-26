-- rafi.plugins.extras.org.zk
--

return {

	-- Extension for the zk plain text note-taking assistant
	{
		'zk-org/zk-nvim',
		main = 'zk',
		ft = 'markdown',
		cmd = { 'ZkNew', 'ZkNotes', 'ZkTags', 'ZkMatch' },
		-- stylua: ignore
		keys = {
			{ '<leader>zn', "<Cmd>ZkNew { title = vim.fn.input('标题: ') }<CR>", desc = 'Zk 新建' },
			{ '<leader>zo', "<Cmd>ZkNotes { sort = { 'modified' } }<CR>", desc = 'Zk 笔记' },
			{ '<leader>zt', '<Cmd>ZkTags<CR>', desc = 'Zk 标签' },
			{ '<leader>zf', "<Cmd>ZkNotes { sort = { 'modified' }, match = { vim.fn.input('搜索: ') } }<CR>", desc = 'Zk 搜索' },
			{ '<leader>zg', ":'<,'>ZkMatch<CR>', mode = 'x', desc = 'Zk 匹配' },
			{ '<leader>zb', '<Cmd>ZkBacklinks<CR>', desc = 'Zk 反向链接' },
			{ '<leader>zl', '<Cmd>ZkLinks<CR>', desc = 'Zk 链接' },
		},
		opts = {
			picker = 'telescope',
			-- lsp = {
			-- 	auto_attach = {
			-- 		enabled = false,
			-- 	},
			-- },
		},
	},

	{
		'nvim-telescope/telescope.nvim',
		optional = true,
		keys = {
			{ '<localleader>w', '<cmd>ZkNotes<CR>', desc = 'Zk 笔记' },
		},
	},
}
