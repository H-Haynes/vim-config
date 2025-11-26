-- Plugins: Git
-- https://github.com/rafi/vim-config

local has_git = vim.fn.executable('git') == 1

return {

	-----------------------------------------------------------------------------
	-- Git signs written in pure lua
	-- See: https://github.com/lewis6991/gitsigns.nvim#usage
	-- NOTE: This extends
	-- $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/plugins/editor.lua
	{
		'gitsigns.nvim',
		cond = has_git,
		-- stylua: ignore
		keys = {
				{ ']g', ']h', desc = '下一个代码块', remap = true },
				{ '[g', '[h', desc = '上一个代码块', remap = true },
				{ 'gs',           function() package.loaded.gitsigns.preview_hunk() end, desc = '预览代码块' },
				{ '<leader>ghtb', function() package.loaded.gitsigns.toggle_current_line_blame() end, desc = '切换 Git 行注释' },
				{ '<leader>ghtd', function() package.loaded.gitsigns.toggle_deleted() end, desc = '切换 Git 删除标记' },
				{ '<leader>ghtw', function() package.loaded.gitsigns.toggle_word_diff() end, desc = '切换 Git 单词差异' },
				{ '<leader>ghtl', function() package.loaded.gitsigns.toggle_linehl() end, desc = '切换 Git 行高亮' },
				{ '<leader>ghtn', function() package.loaded.gitsigns.toggle_numhl() end, desc = '切换 Git 行号高亮' },
				{ '<leader>ghts', function() package.loaded.gitsigns.toggle_signs() end, desc = '切换 Git 标记' },
		},
		-- stylua: ignore
		opts = {
			signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
			numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
			current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
			attach_to_untracked = true,
			watch_gitdir = {
				interval = 1000,
				follow_files = true,
			},
			preview_config = {
				border = 'rounded',
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Tabpage interface for cycling through diffs
	{
		'sindrets/diffview.nvim',
		cond = has_git,
		cmd = { 'DiffviewOpen', 'DiffviewFileHistory' },
		keys = {
			{ '<leader>gD', '<cmd>DiffviewFileHistory %<CR>', desc = '文件差异' },
			{ '<leader>gv', '<cmd>DiffviewOpen<CR>', desc = '差异视图' },
		},
		opts = function()
			local actions = require('diffview.actions')
			vim.api.nvim_create_autocmd({ 'WinEnter', 'BufEnter' }, {
				group = vim.api.nvim_create_augroup('rafi.diffview', {}),
				pattern = 'diffview:///panels/*',
				callback = function()
					vim.opt_local.cursorline = true
					vim.opt_local.winhighlight = 'CursorLine:WildMenu'
				end,
			})

			return {
				enhanced_diff_hl = true, -- See ':h diffview-config-enhanced_diff_hl'
				keymaps = {
					view = {
						{ 'n', 'q', actions.close },
						{ 'n', '<Tab>', actions.select_next_entry },
						{ 'n', '<S-Tab>', actions.select_prev_entry },
						{ 'n', '<localleader>a', actions.focus_files },
						{ 'n', '<localleader>e', actions.toggle_files },
					},
					file_panel = {
						{ 'n', 'q', actions.close },
						{ 'n', 'h', actions.prev_entry },
						{ 'n', 'o', actions.focus_entry },
						{ 'n', 'gf', actions.goto_file },
						{ 'n', 'sg', actions.goto_file_split },
						{ 'n', 'st', actions.goto_file_tab },
						{ 'n', '<C-r>', actions.refresh_files },
						{ 'n', '<localleader>e', actions.toggle_files },
					},
					file_history_panel = {
						{ 'n', 'q', '<cmd>DiffviewClose<CR>' },
						{ 'n', 'o', actions.focus_entry },
						{ 'n', 'O', actions.options },
					},
				},
			}
		end,
	},

	-----------------------------------------------------------------------------
	-- Magit clone for Neovim
	{
		'NeogitOrg/neogit',
		cond = has_git,
		cmd = 'Neogit',
		keys = {
			{ '<leader>mg', '<cmd>Neogit<CR>', desc = 'Neogit' },
		},
		-- See: https://github.com/TimUntersberger/neogit#configuration
		opts = {
			disable_signs = false,
			disable_context_highlighting = false,
			disable_commit_confirmation = false,
			signs = {
				section = { '>', 'v' },
				item = { '>', 'v' },
				hunk = { '', '' },
			},
			integrations = {
				diffview = true,
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Git blame visualizer
	{
		'FabijanZulj/blame.nvim',
		cond = has_git,
		cmd = 'ToggleBlame',
		-- stylua: ignore
		keys = {
			{ '<leader>gb', '<cmd>BlameToggle virtual<CR>', desc = 'Git 注释' },
			{ '<leader>gB', '<cmd>BlameToggle window<CR>', desc = 'Git 注释（窗口）' },
		},
		opts = {
			date_format = '%Y-%m-%d %H:%M',
			merge_consecutive = false,
			max_summary_width = 30,
			mappings = {
				commit_info = 'K',
				stack_push = '>',
				stack_pop = '<',
				show_commit = '<CR>',
				close = { '<Esc>', 'q' },
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Pleasant editing on Git commit messages
	{
		'rhysd/committia.vim',
		cond = has_git,
		event = 'BufReadPre COMMIT_EDITMSG',
		init = function()
			-- See: https://github.com/rhysd/committia.vim#variables
			vim.g.committia_min_window_width = 30
			vim.g.committia_edit_window_width = 75
		end,
		config = function()
			vim.g.committia_hooks = {
				edit_open = function()
					vim.cmd.resize(10)
					local opts = {
						buffer = vim.api.nvim_get_current_buf(),
						silent = true,
					}
					local function map(mode, lhs, rhs)
						vim.keymap.set(mode, lhs, rhs, opts)
					end
					map('n', 'q', '<cmd>quit<CR>')
					map('i', '<C-d>', '<Plug>(committia-scroll-diff-down-half)')
					map('i', '<C-u>', '<Plug>(committia-scroll-diff-up-half)')
					map('i', '<C-f>', '<Plug>(committia-scroll-diff-down-page)')
					map('i', '<C-b>', '<Plug>(committia-scroll-diff-up-page)')
					map('i', '<C-j>', '<Plug>(committia-scroll-diff-down)')
					map('i', '<C-k>', '<Plug>(committia-scroll-diff-up)')
				end,
			}
		end,
	},
}
