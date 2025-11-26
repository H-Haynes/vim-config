-- rafi.plugins.extras.lang.kubernetes
--

return {
	desc = '引入 YAML 语言扩展并提供常见清单 Schema 模式。',
	recommended = function()
		return LazyVim.extras.wants({ ft = 'yaml' })
	end,

	{ import = 'lazyvim.plugins.extras.lang.yaml' },

	{
		'ramilito/kubectl.nvim',
		cmd = { 'Kubectl', 'Kubectx', 'Kubens' },
		-- stylua: ignore
		keys = {
			{ '<leader>8', function() vim.cmd[[tabnew]]; require('kubectl').open() end, desc = 'Kubectl 控制台' },
		},
		opts = {},
	},

	{
		'neovim/nvim-lspconfig',
		opts = {
			servers = {
				yamlls = {
					settings = {
						yaml = {
							completion = true,
							hover = true,
							schemas = {
								kubernetes = { 'k8s**.yaml', 'kube*/*.yaml' },
							},
						},
					},
				},
			},
		},
	},
}
