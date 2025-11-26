return {

	-- Bookmarks plugin with global file store
	{
		'tomasky/bookmarks.nvim',
		event = 'FileType',
		-- stylua: ignore
		keys = {
			{ 'm', "", desc = '+标记' },
			{ 'mm', function() require('bookmarks').bookmark_toggle() end, desc = '切换标记' },
			{ 'mi', function() require('bookmarks').bookmark_ann() end, desc = '注释标记' },
			{ 'm<BS>', function() require('bookmarks').bookmark_clean() end, desc = '清理缓冲区标记' },
			{ 'm]', function() require('bookmarks').bookmark_next() end, desc = '跳转到下一个标记' },
			{ 'm[', function() require('bookmarks').bookmark_prev() end, desc = '跳转到上一个标记' },
			{ 'ml', function() require('bookmarks').bookmark_list() end, desc = '列出标记' },
			{ 'm<Space>', function() require('bookmarks').bookmark_clear_all() end, desc = '移除所有标记' },
		},
		opts = {
			save_file = vim.fn.stdpath('state') .. '/bookmarks.json',
			keywords = {
				['@t'] = ' ',
				['@w'] = ' ',
				['@f'] = '⛏ ',
				['@n'] = ' ',
			},
		},
	},
}
