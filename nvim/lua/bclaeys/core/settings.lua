-- ----------------------------------------------
-- MIJN VIMRC HERSCHREVEN DOOR CHATGPT IN LUA  -- 
-- 					SETTINGS
-- ----------------------------------------------

vim.opt.filetype = "on"
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.compatible = false
vim.opt.hidden = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.path:append("common_core/projects/")
vim.opt.showcmd = true
vim.opt.wrap = false
-- vim.opt.foldmethod = "syntax"
-- vim.cmd('autocmd BufRead * normal! zR')
vim.opt.laststatus = 2
  vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.cursorline = true
vim.opt.colorcolumn = "80"
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    pattern = "*",
    command = "highlight CursorLine guifg=NONE guibg=NONE ctermfg=NONE ctermbg=NONE"
})

vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    pattern = "*",
    command = "highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue"
})

-- ----------------------------------------------
--               nieuwe functies               -- 
-- ----------------------------------------------

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = "unnamedplus"

-- Enable break indent
vim.o.breakindent = true

-- No swap files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false

-- Save undo history
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = "no"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Ve in tree list style
vim.cmd("let g:netrw_liststyle = 3")

-- " Start scrolling when we are 8 lines aways from borders
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 15
vim.opt.sidescroll = 5

-- Lazy redraw
vim.o.lazyredraw = true

-- hiermee kan ik highlights setten --
require("bclaeys.lazy")
vim.cmd [[colorscheme tokyonight]]
-- vim.cmd [[colorscheme gruvbox]]
require("tokyonight").setup({
-- require("gruvbox").setup({
  style = "storm",
  -- disable italic for functions
  styles = {
    functions = {}
  },
  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff0000"
  end
})
-- vim.api.nvim_set_hl(0, "Normal", {bg = "#3c3836", underline = false, bold = true}) -- voor gruvbox
-- vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#3c3836", underline = true, bold = true}) -- voor gruvbox
vim.api.nvim_set_hl(0, "Normal", {bg = "#1f0031", underline = false, bold = true}) -- voor tokyonight
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#1f0031", underline = true, bold = true}) -- voor tokyonight

-- change default comment mode
-- local function augroup(name)
-- 	return vim.api.nvim_create_augroup("lazyvim_config_" .. name, { clear = true })
-- end

-- vim.api.nvim_create_autocmd("FileType", {
-- -- 	group = augroup("commentstring"),
-- -- 	pattern = { "c", "cpp" },
-- 	callback = function()
	-- 	vim.opt.commentstring = "/* %s */"
	-- end,
-- 	desc = "Change commentstring for c/c++ files",
-- })

-- Automatically write the standard header upon creation of certain filetypes
-- vim.api.nvim_create_autocmd("BufNewFile", {
--     pattern = {"*.c", "*.cpp", "*.h", "*.hpp", "*.mk", "Makefile", "makefile"},
	-- command = 'Stdheader'
	-- command = "echo 'entering'"
-- })

-- setup for goto-preview
--require('goto-preview').setup {
--  width = 120, -- Width of the floating window
 -- height = 30, -- Height of the floating window
--  border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}, -- Border characters of the floating window
--  default_mappings = false, -- Bind default mappings
--  debug = false, -- Print debug information
--  opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
--  resizing_mappings = true, -- Binds arrow keys to resizing the floating window.
--  post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
--  post_close_hook = nil, -- A function aking two arguments, a buffer and a window to be ran as a hook.
--  references = { -- Configure the telescope UI for slowing the references cycling window.
--    telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
--  },
--  -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
--  focus_on_open = true, -- Focus the floating window when opening it.
--  dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
--  force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
--  bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
--  stack_floating_preview_windows = true, -- Whether to nest floating windows
--  preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
--  zindex = 1, -- Starting zindex for the stack of floating windows
--}


-- Ik probeer met de volgende lijnen om de builtin lsp van nvim te gebruiken
-- bron: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#clangd
-- vim.lsp.config.clangd = {
  -- cmd = { 'clangd', '--background-index' },
  -- root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  -- filetypes = { 'c', 'cpp' },
-- }

-- vim.lsp.enable({'clangd'})

vim.g.mkdp_browser = "firefox"  -- use Firefox as the browser

-- from vim-markdown readme: You can use filetype name as fenced code block languages for syntax highlighting. 
-- vim.g.vim_markdown_fenced_languages = { "mermaid=mmd" }

-- ----------------------------------------------
-- ----------------------------------------------
--          templates (skeleton files)         -- 
-- ----------------------------------------------
-- --
vim.api.nvim_create_autocmd("BufNewFile", {
  pattern = "*.hpp",
  command = "0r ~/.config/nvim/lua/bclaeys/skeletons/newClass.hpp"
})
