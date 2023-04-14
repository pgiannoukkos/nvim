-- disable netrw to use nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.background = 'dark'
vim.opt.termguicolors = true --> set term gui colors (most terminals support this)
vim.opt.clipboard = 'unnamedplus' --> allows neovim to access the system clipboard
vim.opt.cmdheight = 1 --> more space in the neovim command line for displaying messages
vim.opt.completeopt = { 'menuone', 'noselect' } --> mostly just for cmp
vim.opt.conceallevel = 0 --> so that `` is visible in markdown files
vim.opt.encoding = 'utf-8' --> the encoding written to a file
vim.opt.pumheight = 10 --> pop-up menu height
vim.opt.showmode = false --> don't need to see things like -- INSERT -- anymore
vim.opt.showcmd = true --> show (partial) command in the last line of the screen
vim.opt.showtabline = 2 --> always show tabs
vim.opt.signcolumn = 'yes' --> always show the signcolumn, otherwise it would shift the text each time
vim.opt.mouse = '' --> allow the mouse to be used in neovim
vim.opt.wildmenu = true --> command-line completion operates in an enhanced mode
vim.opt.wrap = false --> line wrapping
vim.opt.splitbelow = true --> force all horizontal splits to go below the current window
vim.opt.splitright = true --> force all vertical splits to go the right of the current window
vim.opt.cursorline = true --> highlight the current line
vim.opt.cursorcolumn = false --> highlight the current column
vim.opt.scrolloff = 15
vim.opt.sidescrolloff = 8
vim.opt.laststatus = 3

vim.opt.number = true --> set numbered lines
vim.opt.relativenumber = true --> set relative numbered lines
vim.opt.numberwidth = 2 --> set number column width to 2 (default = 4)

vim.opt.tabstop = 4 --> insert four spaces for a tab
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4 --> the number of spaces inserted for each indentation
vim.opt.expandtab = true --> convert tabs to spaces
vim.opt.smartindent = true --> make indenting smarter

vim.opt.swapfile = false --> creates a swap file
vim.opt.backup = false --> create a backup file
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir' --> directory for the undofile, goes with the next option
vim.opt.undofile = true --> use undofile
vim.opt.writebackup = false --> if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.hlsearch = false --> highlight all matches on previous search pattern
vim.opt.incsearch = true
vim.opt.ignorecase = true --> ignore case in search patterns
vim.opt.smartcase = true --> Override the `ignorecase` option if the search pattern contains upper case characters.

vim.opt.updatetime = 50 --> faster update time (4000ms default)
vim.opt.timeoutlen = 500 --> time to wait for a mapped sequence to complete (milliseconds)

vim.opt.list = true
vim.opt.listchars:append('tab:> ')
-- vim.opt.listchars:append('eol:↴')
-- vim.opt.listchars:append('space:⋅')

vim.opt.shortmess:append('c')
vim.opt.whichwrap:append('<,>,[,],h,l')
vim.opt.iskeyword:append('-')

