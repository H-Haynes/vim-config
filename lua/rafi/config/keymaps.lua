-- Rafi's Neovim keymaps
-- https://github.com/rafi/vim-config
-- ===

-- This file is automatically loaded by lua/rafi/config/lazy.lua
-- Extends $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/config/keymaps.lua

local map = vim.keymap.set
local unmap = function(modes, lhs)
	modes = type(modes) == 'string' and { modes } or modes
	lhs = type(lhs) == 'string' and { lhs } or lhs
	for _, mode in pairs(modes) do
		for _, l in pairs(lhs) do
			pcall(vim.keymap.del, mode, l)
		end
	end
end

-- stylua: ignore start

-- Picker {{{

-- Bind localleader to common LazyVim picker (telescope/fzf/snacks) keymaps.
map('n', '<localleader>r', '<leader>sR', { remap = true, desc = '恢复上次' })
map('n', '<localleader>f', '<leader>ff', { remap = true, desc = '查找文件（根目录）' })
map('n', '<localleader>F', '<leader>fF', { remap = true, desc = '查找文件（当前目录）' })
map('n', '<localleader>g', '<leader>sg', { remap = true, desc = '全局搜索（根目录）' })
map('n', '<localleader>G', '<leader>sG', { remap = true, desc = '全局搜索（当前目录）' })
map('n', '<localleader>b', '<leader>,',  { remap = true, desc = '切换缓冲区' })
map('n', '<localleader>B', '<leader>sB', { remap = true, desc = '搜索已打开的缓冲区' })
map('n', '<localleader>l', '<leader>sb', { remap = true, desc = '搜索当前缓冲区行' })
map('n', '<localleader>h', '<leader>sh', { remap = true, desc = '帮助文档' })
map('n', '<localleader>H', '<leader>sH', { remap = true, desc = '搜索高亮组' })
map('n', '<localleader>j', '<leader>sj', { remap = true, desc = '跳转列表' })
map('n', '<localleader>m', '<leader>sm', { remap = true, desc = '跳转到标记' })
map('n', '<localleader>M', '<leader>sM', { remap = true, desc = 'Man 文档' })
map('n', '<localleader>o', '<leader>so', { remap = true, desc = '选项' })
map('n', '<localleader>t', '<leader>ss', { remap = true, desc = '跳转符号' })
map('n', '<localleader>T', '<leader>sS', { remap = true, desc = '跳转符号（工作区）' })
map('n', '<localleader>v', '<leader>s"', { remap = true, desc = '寄存器' })
map('n', '<localleader>s', '<leader>qS', { remap = true, desc = '会话' })
map('n', '<localleader>x', '<leader>fr', { remap = true, desc = '最近文件' })
map('n', '<localleader>X', '<leader>fR', { remap = true, desc = '最近文件（当前目录）' })
map('n', '<localleader>;', '<leader>sc', { remap = true, desc = '命令历史' })
map('n', '<localleader>:', '<leader>sC', { remap = true, desc = '命令' })
map('n', '<localleader>p', '<leader>fp', { remap = true, desc = '项目' })
map({ 'n', 'x' }, '<leader>gg', '<leader>sw', { remap = true, desc = '选区或单词（根目录）' })
map({ 'n', 'x' }, '<leader>gG', '<leader>sW', { remap = true, desc = '选区或单词（当前目录）' })

-- }}}
-- Navigation {{{

if vim.F.if_nil(vim.g.elite_mode, false) then
	-- Elite-mode: Arrow-keys resize window
	map('n', '<Up>', '<cmd>resize +1<cr>', { desc = '增加窗口高度' })
	map('n', '<Down>', '<cmd>resize -1<cr>', { desc = '减少窗口高度' })
	map('n', '<Left>', '<cmd>vertical resize +1<cr>', { desc = '增加窗口宽度' })
	map('n', '<Right>', '<cmd>vertical resize -1<cr>', { desc = '减少窗口宽度' })
	unmap('n', { '<C-Up>', '<C-Down>', '<C-Left>', '<C-Right>' })
else
	-- Moves through display-lines, unless count is provided
	map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = '向下' })
	map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = '向上' })

	-- Resize window using <ctrl> arrow keys
	map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = '增加窗口高度' })
	map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = '减少窗口高度' })
	map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = '减少窗口宽度' })
	map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = '增加窗口宽度' })
end

unmap('n', { '<S-h>', '<S-l>' })

-- Easier line-wise movement
map('n', 'gh', 'g^', { desc = '跳至屏幕首字符' })
map('n', 'gl', 'g$', { desc = '跳至屏幕尾字符' })

-- Navigation in command line
map('c', '<C-h>', '<Home>')
map('c', '<C-l>', '<End>')
map('c', '<C-f>', '<Right>')
map('c', '<C-b>', '<Left>')

-- Scroll step sideways
map('n', 'zl', 'z4l')
map('n', 'zh', 'z4h')

-- Toggle fold or select option from popup menu
map('n', '<CR>', function()
	return vim.fn.pumvisible() == 1 and '<CR>' or 'za'
end, { expr = true, desc = '切换折叠' })

-- Focus the current fold by closing all others
map('n', '<S-Return>', 'zMzv', { remap = true, desc = '聚焦折叠' })

-- Tabs: Many ways to navigate them
map('n', '<A-j>', '<cmd>tabnext<CR>', { desc = '下一个标签页' })
map('n', '<A-k>', '<cmd>tabprevious<CR>', { desc = '上一个标签页' })
map('n', '<A-[>', '<cmd>tabprevious<CR>', { desc = '上一个标签页' })
map('n', '<A-]>', '<cmd>tabnext<CR>', { desc = '下一个标签页' })
map('n', '<C-Tab>', '<cmd>tabnext<CR>', { desc = '下一个标签页' })
map('n', '<C-S-Tab>', '<cmd>tabprevious<CR>', { desc = '上一个标签页' })

-- Moving tabs
map('n', '<A-{>', '<cmd>-tabmove<CR>', { desc = '标签左移' })
map('n', '<A-}>', '<cmd>+tabmove<CR>', { desc = '标签右移' })

-- }}}
-- Selection {{{

map('n', '<Leader><Leader>', 'V', { desc = '可视模式' })
map('x', '<Leader><Leader>', '<Esc>', { desc = '退出可视模式' })

-- Select last paste
map('n', 'vsp', "'`['.strpart(getregtype(), 0, 1).'`]'", { expr = true, desc = '选择粘贴区域' })

-- Quick substitute within selected area
map('x', 'sg', ':s//gc<Left><Left><Left>', { desc = '选区替换' })

-- C-r: Easier search and replace visual/select mode
map(
	'x',
	'<C-r>',
	":<C-u>%s/\\V<C-R>=v:lua.get_visual_selection()<CR>"
		.. '//gc<Left><Left><Left>',
	{ desc = '替换选区' }
)

-- Use tab for indenting in visual/select mode
map('x', '<Tab>', '>', { remap = true, desc = '向右缩进' })
map('x', '<S-Tab>', '<', { remap = true, desc = '向左缩进' })

-- Better block-wise operations on selected area
local blockwise_force = function(key)
	local c_v = vim.api.nvim_replace_termcodes('<C-v>', true, false, true)
	local keyseq = {
		I  = { v = '<C-v>I',  V = '<C-v>^o^I', [c_v] = 'I' },
		A  = { v = '<C-v>A',  V = '<C-v>0o$A', [c_v] = 'A' },
		gI = { v = '<C-v>0I', V = '<C-v>0o$I', [c_v] = '0I' },
	}
	return function()
		return keyseq[key][vim.fn.mode()]
	end
end
map('x', 'I',  blockwise_force('I'),  { expr = true, noremap = true, desc = '块插入' })
map('x', 'gI', blockwise_force('gI'), { expr = true, noremap = true, desc = '块插入' })
map('x', 'A',  blockwise_force('A'),  { expr = true, noremap = true, desc = '块追加' })

-- }}}
-- Jump to {{{

map('n', ']a', '<cmd>lnext<CR>', { desc = '下一个位置列表' })
map('n', '[a', '<cmd>lprev<CR>', { desc = '上一个位置列表' })

-- Whitespace jump (see plugin/whitespace.vim)
map('n', ']z', function() whitespace_jump(1) end, { desc = '下一个空白问题' })
map('n', '[z', function() whitespace_jump(-1) end, { desc = '上一个空白问题' })

-- Diagnostic movement
local diagnostic_jump = function(count, severity)
	local severity_int = severity and vim.diagnostic.severity[severity] or nil
	if vim.fn.has('nvim-0.11') == 1 then
		return function()
			vim.diagnostic.jump({ severity = severity_int, count = count })
		end
	end
	-- Pre 0.11
	---@diagnostic disable-next-line: deprecated
	local jump = count > 0 and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
	return function()
		jump({ severity = severity_int })
	end
end
map('n', ']d', diagnostic_jump(1), { desc = '下一个诊断' })
map('n', '[d', diagnostic_jump(-1), { desc = '上一个诊断' })
map('n', ']e', diagnostic_jump(1, 'ERROR'), { desc = '下一个错误' })
map('n', '[e', diagnostic_jump(-1, 'ERROR'), { desc = '上一个错误' })
map('n', ']w', diagnostic_jump(1, 'WARN'), { desc = '下一个警告' })
map('n', '[w', diagnostic_jump(-1, 'WARN'), { desc = '上一个警告' })

-- }}}
-- Clipboard {{{
-- ===

-- Paste in visual-mode without pushing to register
map('x', 'p', 'p:let @+=@0<CR>:let @"=@0<CR>', { silent = true, desc = '粘贴' })
map('x', 'P', 'P:let @+=@0<CR>:let @"=@0<CR>', { silent = true, desc = '原位粘贴' })

-- Yank buffer's relative path to clipboard
map('n', '<Leader>y', function()
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':~:.') or ''
	vim.fn.setreg('+', path)
	vim.notify(path, vim.log.levels.INFO, { title = '已复制相对路径' })
end, { silent = true, desc = '复制相对路径' })

-- Yank absolute path
map('n', '<Leader>Y', function()
	local path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':p') or ''
	vim.fn.setreg('+', path)
	vim.notify(path, vim.log.levels.INFO, { title = '已复制绝对路径' })
end, { silent = true, desc = '复制绝对路径' })

-- }}}
-- Coding {{{

-- Comment
unmap('n', { 'gra', 'gri', 'grr', 'grn' })
map('n', '<Leader>v', 'gcc', { remap = true, desc = '注释当前行' })
map('x', '<Leader>v', 'gc', { remap = true, desc = '注释选区' })

-- Macros
map('n', '<C-q>', 'q', { desc = '宏前缀' })

-- Formatting
map('n', '<leader>cid', '<cmd>LazyDev<CR>', { silent = true, desc = '开发信息' })
map('n', '<leader>cif', '<cmd>LazyFormatInfo<CR>', { silent = true, desc = '格式化信息' })
map('n', '<leader>cir', '<cmd>LazyRoot<CR>', { silent = true, desc = '项目根目录' })
map('n', '<leader>cil', '<cmd>check lspconfig<cr>', { desc = 'LSP 信息' })
map({ 'n', 'x' }, '<leader>cs', function() formatter_select() end, { desc = '选择格式化器' })

-- Start new line from any cursor position in insert-mode
map('i', '<S-Return>', '<C-o>o', { desc = '插入新行' })
map('n', ']<Leader>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', { silent = true, desc = '新建行' })
map('n', '[<Leader>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', { silent = true, desc = '新建行' })

-- Drag current line(s) vertically and auto-indent
map('n', '<Leader>k', '<cmd>move-2<CR>==', { silent = true, desc = '上移一行' })
map('n', '<Leader>j', '<cmd>move+<CR>==', { silent = true, desc = '下移一行' })
map('x', '<Leader>k', ":move'<-2<CR>gv=gv", { silent = true, desc = '上移选区' })
map('x', '<Leader>j', ":move'>+<CR>gv=gv", { silent = true, desc = '下移选区' })

-- Duplicate lines without affecting PRIMARY and CLIPBOARD selections.
map('n', '<Leader>dd', 'm`""Y""P``', { desc = '复制行' })
map('x', '<Leader>dd', '""Y""Pgv', { desc = '复制选区' })

-- }}}
-- Search, substitute, diff {{{

-- Switch */g* and #/g#
map('n', '*', 'g*')
map('n', 'g*', '*')
map('n', '#', 'g#')
map('n', 'g#', '#')

map('n', '<C-c>', 'ciw', { desc = '替换单词' })

-- Use backspace key for matching pairs
map({ 'n', 'x' }, '<BS>', '%', { remap = true, desc = '跳转括号' })

-- Toggle diff on all windows in current tab
map('n', '<Leader>bf', function()
	vim.cmd('windo diff' .. (vim.wo.diff and 'off' or 'this'))
end, { desc = '窗口差异对比' })

-- External diff
map('n', '<Leader>bF', '<cmd>!' .. vim.g.diffprg .. ' % #<CR>', { desc = '与外部程序对比' .. vim.g.diffprg })

-- }}}
-- Command & History {{{

-- Put vim command output into buffer
map('n', 'g!', ":put=execute('')<Left><Left>", { desc = '粘贴命令输出' })

-- Switch history search pairs, matching my bash shell
map('c', '<Up>', '<C-p>')
map('c', '<Down>', '<C-n>')
map('c', '<C-p>', function()
	return vim.fn.pumvisible() == 1 and '<C-p>' or '<Up>'
end, { expr = true })
map('c', '<C-n>', function()
	return vim.fn.pumvisible() == 1 and '<C-n>' or '<Down>'
end, { expr = true })

-- }}}
-- File operations {{{

-- Switch (tab) to the directory of the current opened buffer
map('n', '<Leader>cd', function()
	local bufdir = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ':p:h')
	if bufdir ~= nil and vim.uv.fs_stat(bufdir) then
		vim.cmd.tcd(bufdir)
		vim.notify(bufdir)
	end
end, { desc = '切换标签页目录' })

-- Fast saving from all modes
unmap('n', { '<leader>w', '<leader>wd', '<leader>wm' })
map('n', '<Leader>w', '<cmd>write<CR>', { desc = '保存文件' })
map('n', '<M-s>', '<cmd>write<CR>', { desc = '保存文件' })

-- }}}
-- Editor UI {{{

-- Toggle list windows
map('n', '<leader>xl', function() toggle_list('loclist') end, { desc = '切换位置列表' })
map('n', '<leader>xq', function() toggle_list('quickfix') end, { desc = '切换快速修复列表' })

map('n', '<Leader>ce', vim.diagnostic.open_float, { desc = '行诊断' })

-- Set locations with diagnostics and open the list.
map('n', '<Leader>a', function()
	if vim.bo.filetype ~= 'qf' then
		vim.diagnostic.setloclist({ open = false })
	end
	toggle_list('loclist')
end, { desc = '打开位置列表' })

-- }}}
-- Plugins & Tools {{{

-- Package-manager
map('n', '<leader>mx', '<cmd>LazyExtras<cr>', { desc = '打开插件扩展' })

-- Append mode-line to current buffer
map('n', '<Leader>ml', function() append_modeline() end, { desc = '添加文件设置行' })

-- Jump entire buffers throughout jumplist
map('n', 'g<C-i>', function() jump_buffer(1) end, { desc = '跳转到较新的缓冲区' })
map('n', 'g<C-o>', function() jump_buffer(-1) end, { desc = '跳转到较旧的缓冲区' })

-- Context aware menu. See lua/lib/contextmenu.lua
map('n', '<RightMouse>', function() require('rafi.util.contextmenu').show() end, { desc = '上下文菜单' })
map('n', '<LocalLeader>c', function() require('rafi.util.contextmenu').show() end, { desc = '上下文菜单' })

-- Base64 encode/decode
map('x', '<leader>64e', function() base64() end, { desc = 'Base64 编码' })
map('x', '<leader>64d', function() base64(false) end, { desc = 'Base64 解码' })

-- Lazygit
if vim.fn.executable('lazygit') == 1 then
	---@diagnostic disable-next-line: missing-fields
	map('n', '<leader>gt', function() Snacks.lazygit( { cwd = LazyVim.root.git() }) end, { desc = 'Lazygit（根目录）' })
	map('n', '<leader>gT', function() Snacks.lazygit() end, { desc = 'Lazygit（当前目录）' })
end

map('n', '<leader>gm', function() Snacks.picker.git_log_line() end, { desc = '查看行责任' })
map({ 'n', 'x' }, '<leader>go', function() Snacks.gitbrowse() end, { desc = '浏览 Git 链接' })

-- Terminal Mappings
map('t', '<C-g>', '<C-\\><C-n>', { desc = '进入普通模式' })

if vim.fn.has('mac') then
	-- Open the macOS dictionary on current word
	map('n', '<Leader>?', '<cmd>silent !open dict://<cword><CR>', { desc = '词典查询' })
end

-- }}}
-- Windows and buffers {{{

-- When enabled, 'q' closes any window.
if vim.F.if_nil(vim.g.window_q_mapping, false) then
	map('n', 'q', function()
		local plugins = {
			'blame',
			'checkhealth',
			'dbout',
			'fugitive',
			'fugitiveblame',
			'gitsigns-blame',
			'grug-far',
			'help',
			'httpResult',
			'lspinfo',
			'neotest-output',
			'neotest-output-panel',
			'neotest-summary',
			'notify',
			'PlenaryTestPopup',
			'qf',
			'spectre_panel',
			'startuptime',
			'tsplayground',
		}
		local buf = vim.api.nvim_get_current_buf()
		if vim.tbl_contains(plugins, vim.bo[buf].filetype) then
			vim.bo[buf].buflisted = false
			pcall(vim.api.nvim_buf_delete, buf)
		else
			-- Find non-floating windows
			local wins = vim.fn.filter(vim.api.nvim_list_wins(), function(_, win)
				if vim.api.nvim_win_get_config(win).zindex then
					return nil
				end
				return win
			end)
			-- If last window, quit
			if #wins > 1 then
				vim.api.nvim_win_close(0, false)
			else
				vim.cmd[[quit]]
			end
		end
	end, { desc = '关闭窗口' })
end

map('n', 's', '<Nop>', { desc = '+屏幕操作' })
map('n', 's]', '<C-w>x<C-w>w', { remap = true, desc = '交换相邻窗口' })
map('n', 'sb', '<cmd>buffer#<CR>', { desc = '切换上一个缓冲区' })
map('n', 'sc', '<cmd>close<CR>', { desc = '关闭窗口' })
map('n', 'sd', '<cmd>bdelete<CR>', { desc = '删除缓冲区' })
map('n', 'sv', '<cmd>split<CR>', { desc = '水平分割窗口' })
map('n', 'sg', '<cmd>vsplit<CR>', { desc = '垂直分割窗口' })
map('n', 'st', '<cmd>tabnew<CR>', { desc = '新建标签页' })
map('n', 'so', '<cmd>only<CR>', { desc = '关闭其他窗口' })
map('n', 'sq', '<cmd>quit<CR>', { desc = '退出' })
Snacks.toggle.zoom():map('sz')
Snacks.toggle.zen():map('sZ')
map('n', 'sx', function()
	Snacks.bufdelete({ wipe = true })
	vim.cmd.enew()
end, { desc = '删除缓冲区并新建' })

-- }}}

-- FUNCTIONS
-- ===

-- Get visually selected lines.
-- Source: https://github.com/ibhagwan/fzf-lua/blob/main/lua/fzf-lua/utils.lua
---@return string
function _G.get_visual_selection() -- {{{
	-- this will exit visual mode
	-- use 'gv' to reselect the text
	local _, csrow, cscol, cerow, cecol
	local mode = vim.fn.mode()
	local is_visual = vim.tbl_contains({ 'v', 'V', '\22' }, mode)
	if is_visual then
		-- if we are in visual mode use the live position
		_, csrow, cscol, _ = unpack(vim.fn.getpos('.') or { 0, 0, 0, 0 })
		_, cerow, cecol, _ = unpack(vim.fn.getpos('v') or { 0, 0, 0, 0 })
		if mode == 'V' then
			-- visual line doesn't provide columns
			cscol, cecol = 0, 999
		end
	else
		-- otherwise, use the last known visual position
		_, csrow, cscol, _ = unpack(vim.fn.getpos("'<") or { 0, 0, 0, 0 })
		_, cerow, cecol, _ = unpack(vim.fn.getpos("'>") or { 0, 0, 0, 0 })
	end
	-- swap vars if needed
	if cerow < csrow then
		csrow, cerow = cerow, csrow
	end
	if cecol < cscol then
		cscol, cecol = cecol, cscol
	end
	local lines = vim.fn.getline(csrow, cerow)
	-- local n = cerow-csrow+1
	local n = #lines
	if n <= 0 or type(lines) ~= 'table' then
		return ''
	end
	lines[n] = string.sub(lines[n], 1, cecol)
	lines[1] = string.sub(lines[1], cscol)
	return table.concat(lines, '\n')
end -- }}}

--- Base64 encode/decode
---@param encode? boolean
function _G.base64(encode) -- {{{
	vim.cmd('normal! c')
	encode = encode == nil and true or encode
	local txt = vim.fn.getreg()
	if not encode then
		txt = vim.trim(txt)
	end
	local out = ''
	if vim.base64 then
		out = encode and vim.base64.encode(txt) or vim.base64.decode(txt)
	else
		out = vim.fn.system(encode and 'base64' or 'base64 --decode', txt)
	end
	vim.api.nvim_paste(out, false, -1)
end -- }}}

-- Append modeline at end of file.
function _G.append_modeline() -- {{{
	local modeline = string.format(
		'vim: set ts=%d sw=%d tw=%d %set :',
		vim.bo.tabstop,
		vim.bo.shiftwidth,
		vim.bo.textwidth,
		vim.bo.expandtab and '' or 'no'
	)
	local cs = vim.bo.commentstring
	local ok, tccs = pcall(require, 'ts_context_commentstring.internal')
	if ok then
		local ts_cs = tccs.calculate_commentstring()
		if ts_cs then
			cs = ts_cs
		end
	end
	if not cs then
		LazyVim.warn('未找到可用的注释格式')
		return
	end
	modeline = string.gsub(cs, '%%s', modeline)
	vim.api.nvim_buf_set_lines(0, -1, -1, false, { modeline })
end -- }}}

-- Go to newer/older buffer through jumplist.
---@param direction 1 | -1
function _G.jump_buffer(direction) -- {{{
	local jumplist, curjump = unpack(vim.fn.getjumplist() or { 0, 0 })
	if #jumplist == 0 then
		return
	end
	local cur_buf = vim.api.nvim_get_current_buf()
	local jumpcmd = direction > 0 and '<C-i>' or '<C-o>'
	local searchrange = {}
	curjump = curjump + 1
	if direction > 0 then
		searchrange = vim.fn.range(curjump + 1, #jumplist)
	else
		searchrange = vim.fn.range(curjump - 1, 1, -1)
	end

	for _, i in ipairs(searchrange) do
		local nr = jumplist[i]['bufnr']
		if nr ~= cur_buf and vim.fn.bufname(nr):find('^%w+://') == nil then
			local n = tostring(math.abs(i - curjump))
			vim.notify('执行 ' .. jumpcmd .. ' ' .. n .. ' 次')
			jumpcmd = vim.api.nvim_replace_termcodes(jumpcmd, true, true, true)
			vim.cmd.normal({ n .. jumpcmd, bang = true })
			break
		end
	end
end -- }}}

-- Jump to next/previous whitespace error.
---@param direction 1 | -1
function _G.whitespace_jump(direction) -- {{{
	local opts = 'wz'
	if direction < 1 then
		opts = opts .. 'b'
	end

	-- Whitespace pattern: Trailing whitespace or mixed tabs/spaces.
	local pat = '\\s\\+$\\| \\+\\ze\\t'
	vim.fn.search(pat, opts)
end -- }}}

-- Toggle list window
---@param name "quickfix" | "loclist"
function _G.toggle_list(name) -- {{{
	for _, win in pairs(vim.api.nvim_tabpage_list_wins(0)) do
		if vim.api.nvim_win_is_valid(win) and vim.fn.win_gettype(win) == name then
			vim.api.nvim_win_close(win, false)
			return
		end
	end

	if name == 'loclist' then
		vim.cmd([[ botright lopen ]])
	else
		vim.cmd([[ botright copen ]])
	end
end -- }}}

-- Display a list of formatters and apply the selected one.
function _G.formatter_select() -- {{{
	local buf = vim.api.nvim_get_current_buf()
	local is_visual = vim.tbl_contains({ 'v', 'V', '\22' }, vim.fn.mode())
	local cur_start, cur_end
	if is_visual then
		cur_start = vim.fn.getpos('.')
		cur_end = vim.fn.getpos('v')
	end

	-- Collect various sources of formatters.
	---@class rafi.Formatter
	---@field kind string
	---@field name string
	---@field client LazyFormatter|{active:boolean,resolved:string[]}

	---@type rafi.Formatter[]
	local sources = {}
	local fmts = LazyVim.format.resolve(buf)
	for _, fmt in ipairs(fmts) do
		vim.tbl_map(function(resolved)
			table.insert(sources, {
				kind = fmt.name,
				name = resolved,
				client = fmt,
			})
		end, fmt.resolved)
	end

	local total_sources = #sources

	-- Apply formatter source on buffer.
	---@param bufnr number
	---@param source rafi.Formatter
	local apply_source = function(bufnr, source)
		if source == nil then
			return
		end
		LazyVim.try(function()
			return source.client.format(bufnr)
		end, { msg = '格式化器 `' .. source.name .. '` 执行失败' })
	end

	if total_sources == 1 then
		apply_source(buf, sources[1])
	elseif total_sources > 1 then
		-- Display a list of sources to choose from
		vim.ui.select(sources, {
			prompt = '选择格式化器',
			format_item = function(item)
				return item.name .. '（' .. item.kind .. '）'
			end,
		}, function(selected)
			if is_visual then
				-- Restore visual selection
				vim.fn.setpos('.', cur_start)
				vim.cmd([[normal! v]])
				vim.fn.setpos('.', cur_end)
			end
			apply_source(buf, selected)
		end)
	else
		vim.notify('当前文件类型未配置格式化器。', vim.log.levels.WARN)
	end
end -- }}}

-- vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
