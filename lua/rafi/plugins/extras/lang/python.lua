-- rafi.plugins.extras.lang.python
--

LazyVim.on_very_lazy(function()
	vim.filetype.add({
		filename = {
			['dev-requirements.txt'] = 'requirements',
		},
		pattern = {
			['requirements-.*%.txt'] = 'requirements',
		},
	})
end)

return {
	desc = '引入 Python 语言扩展并补充更多语法与模板。',
	recommended = function()
		return LazyVim.extras.wants({
			ft = 'python',
			root = {
				'pyproject.toml',
				'setup.py',
				'setup.cfg',
				'requirements.txt',
				'Pipfile',
				'pyrightconfig.json',
			},
		})
	end,

	{ import = 'lazyvim.plugins.extras.lang.python' },

	{
		'nvim-treesitter/nvim-treesitter',
		opts = {
			ensure_installed = {
				'ninja',
				'python',
				'pymanifest',
				'requirements',
				'rst',
			},
		},
	},
}
