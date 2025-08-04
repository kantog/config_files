-- FUZZY FINDER --
-- Disclaimer: this seems to need sudo rights in order to work. If you don't have
-- sudo rights, just install fzf locally in ~/.local and add it to PATH

return {
  "ibhagwan/fzf-lua",
  event = "VeryLazy",
  config = function()
    require("fzf-lua").setup({
      colorscheme = "gruvbox",
      winopts = {
        fullscreen = true,
        -- preview = {
          -- layout = "vertical",
        --   vertical = "up:45%", -- up|down:size
        -- },
      },
      fzf_opts = {
        ["--keep-right"] = "", -- https://github.com/ibhagwan/fzf-lua/issues/269
        ["--layout"] = "default",
        -- ["--ansi"] = false,
      },
      keymap = {
        fzf = {
          	["ctrl-r"] = "select-all+accept", -- https://github.com/ibhagwan/fzf-lua/issues/324
        },
      },
      files = {
        git_icons = false,
        file_icons = false,    
      },
    })
    vim.keymap.set("n", "<leader>f", "<cmd>lua require('fzf-lua').files()<CR>", { silent = true })--find files in project
    vim.keymap.set("n", "<leader>b", "<cmd>lua require('fzf-lua').buffers()<CR>", { desc = "Fuzzy find recent files" })--find in current open buffers
    vim.keymap.set( "n", "<leader>/", "<cmd>lua require('fzf-lua').live_grep_resume()<CR>", { desc = "Find string in cwd" })--live search in cwd
    vim.keymap.set("n", "gr", ":FzfLua lsp_references<CR>") --find references through LSP

  end,
}
