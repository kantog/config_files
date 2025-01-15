return {
  -- Telescope plugin setup
  {
    'nvim-telescope/telescope.nvim',  -- Plugin repository
	tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },  -- Plenary is required by Telescope
    config = function()
      -- Setup Telescope configuration
      require('telescope').setup{
        defaults = {
          -- Default configuration options
          file_ignore_patterns = {"*.git/*", "node_modules/*"},  -- Ignore files and directories (optional)
        },
      }

      -- Key mappings for using Telescope
      vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>/', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
      vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })
    end,
  },
}
--will only work if ripgrep is installed
