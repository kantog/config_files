-- ----------------------------------------------
-- MIJN VIMRC HERSCHREVEN DOOR CHATGPT IN LUA  -- 
-- ----------------------------------------------
-- Basic settings
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

-- Key mappings-- Key mappings
vim.g.mapleader = " "
vim.keymap.set('i', 'ii', '<Esc>')
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set('n', '<S-S>', ':w<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR> | :mksession!<CR>') --save and create mksession
vim.keymap.set('n', '<leader>x', ':x<CR>')
vim.keymap.set('n', '<leader><Esc>', ':q<CR>')
vim.keymap.set('n', '<Up>', '<C-W>k')
vim.keymap.set('n', '<Down>', '<C-W>j')
vim.keymap.set('n', '<Left>', '<C-W>h')
vim.keymap.set('n', '<Right>', '<C-W>l')
vim.keymap.set('n', '<S-Up>', '<C-W>K')
vim.keymap.set('n', '<S-Down>', '<C-W>J')
vim.keymap.set('n', '<S-Left>', '<C-W>H')
vim.keymap.set('n', '<S-Right>', '<C-W>L')
vim.keymap.set('i', '{<CR>', '{<CR>}<C-o>O<Tab>')
vim.keymap.set('i', '[<CR>', '[<CR>]<C-o>O<Tab>')
vim.keymap.set('i', '(<CR>', '(<CR>)<C-o>O<Tab>')
vim.keymap.set('n', '<leader>+', '<C-a>', {desc = "Increment number"})
vim.keymap.set('n', '<leader>-', '<C-x>', {desc = "Decrement number"})
vim.keymap.set('n', '<leader>v', ':vsplit | lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>i', ':vsplit | lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<leader>d', ':vsplit | lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<leader>rn', 'lua vim.lsp.buf.rename';

-- Append semicolon function
vim.keymap.set('n', ';', function()
  if not string.match(vim.fn.getline('.'), ';$') then
    vim.cmd('normal! A;')
  end
end)

-- Commenting blocks of code
vim.api.nvim_create_augroup('commenting_blocks_of_code', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "c", "cpp", "java", "scala" },
    command = "let b:comment_leader = '// '",
    group = 'commenting_blocks_of_code'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "sh", "ruby", "python" },
    command = "let b:comment_leader = '# '",
    group = 'commenting_blocks_of_code'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "conf", "fstab" },
    command = "let b:comment_leader = '# '",
    group = 'commenting_blocks_of_code'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "tex" },
    command = "let b:comment_leader = '% '",
    group = 'commenting_blocks_of_code'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "mail" },
    command = "let b:comment_leader = '> '",
    group = 'commenting_blocks_of_code'
})
vim.api.nvim_create_autocmd('FileType', {
    pattern = { "vim" },
    command = "let b:comment_leader = '\" '",
    group = 'commenting_blocks_of_code'
})
vim.api.nvim_set_keymap('n', ',cc', ':<C-U>silent! <C-E>s/^/<C-R>=escape(b:comment_leader,\'/\')<CR>/<CR>:nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',cu', ':<C-U>silent! <C-E>s/^\\V<C-R>=escape(b:comment_leader,\'/\')<CR>//e<CR>:nohlsearch<CR>', { noremap = true, silent = true })

-- ----------------------------------------------
--               nieuwe functies               -- 
-- ----------------------------------------------

-- Ve in tree list style
vim.cmd("let g:netrw_liststyle = 3")

require("config.lazy")
vim.cmd [[colorscheme tokyonight]]
require("tokyonight").setup({
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
-- change default comment mode
local function augroup(name)
	return vim.api.nvim_create_augroup("lazyvim_config_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("commentstring"),
	pattern = { "c", "cpp" },
	callback = function()
		vim.opt.commentstring = "/* %s */"
	end,
	desc = "Change commentstring for c/c++ files",
})

-- Automatically write the standard header upon creation of certain filetypes
vim.api.nvim_create_autocmd("BufNewFile", {
    pattern = {"*.c", "*.cpp", "*.h", "*.hpp", "*.mk", "Makefile", "makefile"},
	command = 'Stdheader'
	--command = "echo 'entering'"
})

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
--  post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
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
--
vim.api.nvim_set_hl(0, "Normal", {bg = "#1f0031", underline = false, bold = true})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "#1f0031", underline = true, bold = true})
