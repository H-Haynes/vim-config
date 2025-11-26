-- rafi.plugins.extras.org.wiki
--

return {

	-- Stripped down VimWiki
	{
		'serenevoid/kiwi.nvim',
		-- stylua: ignore
		keys = {
			{ '<leader>zo', function() require('kiwi').open_wiki_index() end, desc = '打开维基' },
			{ '<leader>zd', function() require('kiwi').open_diary_index() end, desc = '日记索引' },
			{ '<leader>zn', function() require('kiwi').open_diary_new() end, desc = '新建日记' },
			{ '<leader>zx', function() require('kiwi').todo.toggle() end, desc = '切换待办' },
		},
	},
}
