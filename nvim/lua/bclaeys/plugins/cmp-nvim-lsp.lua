-- Dit is een overbrugging tussen nvim-cmp en LSP servers. Niet hetzelfde als nvim-cmp zelf.
-- Zonder dit autocomplete nvim-cmp enkel gebaseerd op wat er al in uw file staat.
-- Dit heeft lsp-zero of iets dergelijks nodig en nvim-cmp om te werken.

-- ALL CHATPGT:

return {
  -- cmp-nvim-lsp integration for LSP capabilities
  {
    'hrsh7th/cmp-nvim-lsp',
    config = function()
      -- Configure LSP capabilities for nvim-cmp
      local capabilities = require('cmp_nvim_lsp').default_capabilities() -- Hier heb ik het lokale path veranderd naar clangd, want de binary staat in PATH.

      -- Setup clangd with custom binary path
      require('lspconfig').clangd.setup({
        capabilities = capabilities,
        cmd = { "clangd", "--background-index", "--clang-tidy" },
        -- You can add more clangd-specific options here
      })
    end
  },
}
