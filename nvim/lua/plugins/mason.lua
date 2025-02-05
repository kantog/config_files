return {
		"williamboman/mason.nvim",
		dependencies = {"williamboman/mason-lspconfig.nvim"},
		config = function()
				require('mason').setup({})
				require('mason-lspconfig').setup({
						-- Replace the language servers listed here 
						-- with the ones you want to install
						ensure_installed = {'lua_ls', 'clangd', 'ast_grep'},
						handlers = {
								function(server_name)
										require('lspconfig')[server_name].setup({})
								end,
						},
				})
		end
}
