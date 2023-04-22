-- keymap options
local opts = { noremap = true, silent = true }

-- remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'kj', '<Esc>', { desc = 'Exit insert mode' }) --> press kj fast to exit insert mode
vim.keymap.set('n', '<leader>w', '<cmd>w!<CR>', { desc = 'Save File' }) --> Save
vim.keymap.set('n', '<leader>q', '<cmd>qa!<CR>', { desc = 'Quit Neovim' }) --> Quit
vim.keymap.set('n', '<leader>c', '<cmd>Bdelete!<CR>', { desc = 'Close Buffer' }) --> Close buffer

vim.keymap.set('n', '<leader>pv', '<cmd>NvimTreeToggle<CR>', { desc = 'Toggle NvimTree' }) --> Open file explorer

-- Telescope
local status_ok, builtin = pcall(require, 'telescope.builtin')
if not status_ok then
    return
end

vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>/', function()
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({
        previewer = false,
    }))
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[F]ind [H]elp' })
vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[F]ind by [G]rep' })
vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })

-- keep the cursor in its position when using these commands
vim.keymap.set('n', 'J', 'mzJ`z', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)
vim.keymap.set('n', 'G', 'Gzz', opts)
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

vim.keymap.set('n', 'Q', '<nop>', opts) --> Never press Q

-- move lines up and down
vim.keymap.set('v', 'J', ':m \'>+1<CR>gv=gv', { desc = 'Move lines downwards', silent = true })
vim.keymap.set('v', 'K', ':m \'<-2<CR>gv=gv', { desc = 'Move lines upwards', silent = true })

-- better window navigation
-- now handled by vim-tmux-navigator plugin
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
-- vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
-- vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

-- navigate buffers
vim.keymap.set('n', '<S-l>', '<cmd>bnext<CR>', { desc = 'Next Buffer' })
vim.keymap.set('n', '<S-h>', '<cmd>bprev<CR>', { desc = 'Prev Buffer' })

-- stay in indent mode
vim.keymap.set('v', '<', '<gv', { desc = 'Indent and stay in Visual Mode' })
vim.keymap.set('v', '>', '>gv',{ desc = 'Indent and stay in Visual Mode' })

-- better paste
vim.keymap.set('v', 'p', '"_dP',{ desc = 'Better Paste' })
