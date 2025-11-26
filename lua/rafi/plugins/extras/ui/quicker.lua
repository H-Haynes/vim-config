return {

	-----------------------------------------------------------------------------
	-- Better quickfix window
	{
		'stevearc/quicker.nvim',
		ft = 'qf',
		event = 'QuickFixCmdPost',
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {
			edit = {
				enabled = false,
				autosave = false,
			},
			highlight = {
				lsp = false,
				load_buffers = false,
			},
			-- stylua: ignore
			keys = {
				{ '>', function() require('quicker').expand({ before = 2, after = 2, add_to_existing = true }) end, desc = '展开快速修复上下文' },
				{ '<', function() require('quicker').collapse() end, desc = '折叠快速修复上下文' },
			},
		},
	},
}
