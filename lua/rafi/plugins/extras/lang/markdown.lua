-- rafi.plugins.extras.lang.markdown
--

LazyVim.on_very_lazy(function()
	vim.filetype.add({
		extension = { mdx = 'markdown.mdx' },
	})
end)

return {
	desc = '引入 Markdown 语言扩展，移除 headlines 插件并启用目录生成器。',
	recommended = function()
		return LazyVim.extras.wants({
			ft = { 'markdown', 'markdown.mdx' },
			root = 'README.md',
		})
	end,

	{ import = 'lazyvim.plugins.extras.lang.markdown' },

	-----------------------------------------------------------------------------
	-- Generate table of contents for Markdown files
	{
		'mzlogin/vim-markdown-toc',
		cmd = { 'GenTocGFM', 'GenTocRedcarpet', 'GenTocGitLab', 'UpdateToc' },
		ft = 'markdown',
		keys = {
			{ '<leader>mo', '<cmd>UpdateToc<CR>', desc = '更新目录' },
		},
		init = function()
			vim.g.vmt_auto_update_on_save = 0
		end,
	},
}
