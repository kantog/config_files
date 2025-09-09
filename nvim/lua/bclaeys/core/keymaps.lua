-- ----------------------------------------------
-- MIJN VIMRC HERSCHREVEN DOOR CHATGPT IN LUA  -- 
-- 					KEYMAPS
-- ----------------------------------------------

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set('i', 'ii', '<Esc>')
vim.keymap.set('i', 'kj', '<Esc>')
vim.keymap.set('n', '<S-S>', ':w<CR>')
vim.keymap.set('n', '<leader>w', ':w<CR> | :mksession!<CR>') --save and create mksession
vim.keymap.set('n', '<leader>m', ':mksession!<CR>') --save and create mksession
vim.keymap.set('n', '<leader>x', ':x<CR>')
vim.keymap.set('n', '<leader><Esc>', ':q<CR>')
vim.keymap.set('n', '<leader>z', '<C-z>')

-- remap arrow keys to movement
vim.keymap.set('n', '<Up>', '<C-W>k')
vim.keymap.set('n', '<Down>', '<C-W>j')
vim.keymap.set('n', '<Left>', '<C-W>h')
vim.keymap.set('n', '<Right>', '<C-W>l')
vim.keymap.set('n', '<S-Up>', '<C-W>K')
vim.keymap.set('n', '<S-Down>', '<C-W>J')
vim.keymap.set('n', '<S-Left>', '<C-W>H')
vim.keymap.set('n', '<S-Right>', '<C-W>L')

-- remap space + hjkl keys to movement
vim.keymap.set('n', '<leader>k', '<C-W>k')
vim.keymap.set('n', '<leader>j', '<C-W>j')
vim.keymap.set('n', '<leader>h', '<C-W>h')
vim.keymap.set('n', '<leader>l', '<C-W>l')

vim.keymap.set('i', '{<CR>', '{<CR>}<C-o>O<Tab>')
vim.keymap.set('i', '[<CR>', '[<CR>]<C-o>O<Tab>')
vim.keymap.set('i', '(<CR>', '(<CR>)<C-o>O<Tab>')
vim.keymap.set('n', '<leader>+', '<C-a>', {desc = "Increment number"})
vim.keymap.set('n', '<leader>-', '<C-x>', {desc = "Decrement number"})

vim.keymap.set('n', '<leader>v', ':vsplit | lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', '<leader>i', ':vsplit | lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', '<leader>d', ':vsplit | lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', '<leader>rn', 'lua vim.lsp.buf.rename()<CR>')

vim.api.nvim_set_keymap('n', ',cc', ':<C-U>silent! <C-E>s/^/<C-R>=escape(b:comment_leader,\'/\')<CR>/<CR>:nohlsearch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ',cu', ':<C-U>silent! <C-E>s/^\\V<C-R>=escape(b:comment_leader,\'/\')<CR>//e<CR>:nohlsearch<CR>', { noremap = true, silent = true })

-- Esc to clean search highlight
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- Append semicolon function == interferes with native ; command
-- vim.keymap.set('n', ';', function()
--   if not string.match(vim.fn.getline('.'), ';$') then
  --   vim.cmd('normal! A;')
  -- end
-- end)

--Commenting blocks of code
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
