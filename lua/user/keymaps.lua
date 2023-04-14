-- keymap options
local opts = { noremap = true, silent = true }

-- remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'kj', '<Esc>', opts) --> press kj fast to exit insert mode
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', opts) --> Save
vim.keymap.set('n', '<leader>q', '<cmd>qa!<CR>', opts) --> Quit
vim.keymap.set('n', '<leader>c', '<cmd>Bdelete!<CR>', opts) --> Close buffer

vim.keymap.set('n', '<leader>pv', ':NvimTreeToggle<CR>', opts) --> Open file explorer

-- Telescope
local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
    return
end
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
vim.keymap.set('n', '<leader>fg', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)

-- keep the cursor in its position when using these commands
vim.keymap.set('n', 'J', 'mzJ`z', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'G', 'Gzz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', 'Q', '<nop>', opts) --> Never press Q

-- move lines up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)

-- better window navigation
-- now handled by vim-tmux-navigator plugin
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
-- vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
-- vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- navigate buffers
vim.keymap.set('n', '<S-l>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-h>', ':bprev<CR>', opts)

-- stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- better paste
vim.keymap.set('v', 'p', '"_dP', opts)

