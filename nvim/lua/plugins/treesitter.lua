-- plugins/treesitter.lua
return {
  -- Setup for nvim-treesitter plugin
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  -- Run `:TSUpdate` to ensure parsers are installed/updated
    config = function()
      -- Treesitter Configuration
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "lua", "python", "javascript", "typescript", "html", "css" },  -- Ensure parsers are installed
        highlight = {
          enable = true,  -- Enable syntax highlighting
          additional_vim_regex_highlighting = false,  -- Disable regex highlighting (for compatibility)
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<CR>",
            node_incremental = "<TAB>",
            node_decremental = "<S-TAB>",
            scope_incremental = "<C-space>",
          },
        },
        indent = {
          enable = true,  -- Enable Treesitter-based indentation
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",  -- Select the entire function
              ["if"] = "@function.inner",  -- Select function body
              ["ac"] = "@class.outer",     -- Select the entire class
              ["ic"] = "@class.inner",     -- Select class body
            },
          },
        },
      }
    end,
  },
}

