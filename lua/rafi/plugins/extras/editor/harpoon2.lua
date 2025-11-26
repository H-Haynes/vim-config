return {

	-- Marks for navigating your project
	{
		'ThePrimeagen/harpoon',
		branch = 'harpoon2',
		opts = {
			menu = {
				width = vim.api.nvim_win_get_width(0) - 4,
			},
			settings = {
				save_on_toggle = true,
			},
		},
		-- stylua: ignore
		keys = {
			{ '<local>h', function()
				local harpoon = require('harpoon')
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, desc = '列出位置' },
			{ '<leader>H', function() require('harpoon'):list():add() end, desc = '添加位置' },
			{ '<leader>mr', function() require('harpoon'):list():remove() end, desc = '移除位置' },
			{ '<C-n>', function() require('harpoon'):list():next() end, desc = '下一个位置' },
			{ '<C-p>', function() require('harpoon'):list():prev() end, desc = '上一个位置' },
			{ '<localleader>1', function() require('harpoon'):list():select(1) end, desc = '跳转到文件 1' },
			{ '<localleader>2', function() require('harpoon'):list():select(2) end, desc = '跳转到文件 2' },
			{ '<localleader>3', function() require('harpoon'):list():select(3) end, desc = '跳转到文件 3' },
			{ '<localleader>4', function() require('harpoon'):list():select(4) end, desc = '跳转到文件 4' },
			{ '<localleader>5', function() require('harpoon'):list():select(5) end, desc = '跳转到文件 5' },
		},
	},
}
