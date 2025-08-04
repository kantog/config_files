-- Uitleg van chatgpt:
-- LSP-zero is a Neovim plugin that simplifies the configuration and management of LSPs in a plug-and-play manner. 
-- It focuses on providing a zero-configuration setup for the most commonly used LSP servers while still allowing for extensive customization. 
-- Essentially, it's an abstraction layer on top of nvim-lspconfig that automates the setup of language servers without needing to deal with their individual configurations.
-- Key Features:
--     Zero Configuration: LSP-zero sets up a working LSP environment with minimal effort. 
--     It automatically installs the most common LSP servers with sensible defaults.
--     Simplified Setup: It allows you to focus on coding rather than configuring each LSP individually.
--     Automatic Installations: LSP-zero can install the language servers for you using a built-in server management feature (via mason.nvim or lsp-zero's own installation mechanism).
--     Key Mappings and Defaults: LSP-zero provides default key mappings and features (e.g., auto-completion, diagnostics, etc.) for an easy-to-use experience out of the box.
-- Use Case:
--     Ideal for Users Who Want a Simple LSP Setup: If you want a fast, automatic, and minimal configuration for common LSP servers, LSP-zero is a great choice.
--     Customizable but Focused on Ease of Use: While it provides sensible defaults, you can still modify configurations and install additional LSP servers.

-- ALL CHATPGT:

return {
  'neovim/nvim-lspconfig',  -- Make sure lspconfig is loaded
  config = function()
    require('lspconfig').clangd.setup{
      cmd = { "clangd", "--background-index", "--clang-tidy" }, -- Hier heb ik het lokale path veranderd naar clangd, want de binary staat in PATH.
      -- capabilities = require('cmp_nvim_lsp').default_capabilities(), -- dit is kapot
      on_attach = function(client, bufnr)
        -- Setup keybindings here
        local opts = {buffer = bufnr}
		-- vim.keymap.set('n', '<leader>v', ':vsplit | lua vim.lsp.buf.definition()<cr>', opts) -- zelf toegevoegd
		-- vim.keymap.set('n', '<leader>i', ':vsplit | lua vim.lsp.buf.implementation()<cr>', opts) -- zelf toegevoegd
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      end
    }
  end
}
