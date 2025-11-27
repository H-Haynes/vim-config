-- LSP: Extend LazyVim settings
-- https://github.com/rafi/vim-config

return {

	-----------------------------------------------------------------------------
	-- Quickstart configurations for the Nvim LSP client
	-- NOTE: This extends
	-- $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/plugins/lsp/init.lua
	-- $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/plugins/lsp/keymaps.lua
	{
		'nvim-lspconfig',
		-- stylua: ignore
		opts = {
			keys = {
				{ '<leader>cl', false },
				{ '<c-k>', false, mode = 'i' },
				{ '<leader>cli', vim.lsp.buf.incoming_calls, desc = '传入调用' },
				{ '<leader>clo', vim.lsp.buf.outgoing_calls, desc = '传出调用' },
				{ '<leader>fwa', vim.lsp.buf.add_workspace_folder, desc = '显示工作区文件夹' },
				{ '<leader>fwr', vim.lsp.buf.remove_workspace_folder, desc = '移除工作区文件夹' },
				{ '<leader>fwl', '<cmd>lua =vim.lsp.buf.list_workspace_folders()<CR>', desc = '列出工作区文件夹' },
			},
		},
	},

	-----------------------------------------------------------------------------
	-- Portable package manager for Neovim
	-- NOTE: This extends
	-- $XDG_DATA_HOME/nvim/lazy/LazyVim/lua/lazyvim/plugins/lsp/init.lua
	{
		'mason.nvim',
		priority = 1000, -- Load early to override install method before LazyVim uses it
		opts = {
			ui = {
				border = 'rounded',
			},
		},
		config = function(plugin, opts)
			require('mason').setup(opts)
			-- Override Mason's package install method to prevent "already installing" errors
			-- This needs to happen after Mason is set up but before LazyVim's LSP initialization
			local ok, Package = pcall(require, 'mason-core.package')
			if ok and Package and Package.install then
				-- Store original install method
				local original_install = Package.install
				-- Override install method to handle "already installing" gracefully
				function Package:install(...)
					-- Check if package is already installing
					if self:is_installing() then
						-- Silently return if already installing
						return
					end
					-- Call original install with error handling
					local ok_install, err = pcall(original_install, self, ...)
					if not ok_install and err then
						-- Silently ignore "already installing" errors
						local err_str = tostring(err)
						if not err_str:match('already installing') then
							-- Re-raise other errors
							error(err)
						end
					end
				end
			end
		end,
	},

	-----------------------------------------------------------------------------
	-- Mason LSP config - Disable automatic installation to prevent conflicts
	-- when persistence.nvim loads sessions
	{
		'mason-org/mason-lspconfig.nvim',
		opts = {
			automatic_installation = false,
		},
	},
}
