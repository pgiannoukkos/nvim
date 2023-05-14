vim.notify = require('notify')

vim.o.hlsearch = false       --> set highlight on search
vim.o.incsearch = true       --> use incremental search
vim.o.ignorecase = true      --> case insensitive search...
vim.o.smartcase = true       --> UNLESS /C or capital in search

vim.wo.number = true         --> make line numbers default
vim.wo.relativenumber = true --> make line numbers default
vim.wo.numberwidth = 2

vim.o.mouse = 'a'               --> enable mouse mode

vim.o.clipboard = 'unnamedplus' --> sync clipboard between OS and Neovim

vim.o.breakindent = true        --> enable break indent
vim.o.wrap = false

vim.o.backup = false                                 --> creates a backup file
vim.o.swapfile = false                               --> creates a swap file
vim.o.writebackup = false                            --> disable editing if file is being edited by another program
vim.o.undodir = os.getenv('HOME') .. '/.vim/undodir' --> directory for the undofile
vim.o.undofile = true                                --> save undo history

vim.wo.signcolumn = 'yes'                            --> keep signcolumn on by default
vim.o.showtabline = 2

vim.o.updatetime = 250 --> decrease update time
vim.o.timeout = true
vim.o.timeoutlen = 300

vim.o.tabstop = 4                      --> number of spaces that a <Tab> in the file counts for
vim.o.softtabstop = 4                  --> number of spaces that a <Tab> counts for while performing editing operations
vim.o.shiftwidth = 4                   --> number of spaces to use for each step of (auto)indent
vim.o.expandtab = true                 --> convert tabs to spaces
vim.o.smartindent = true               --> do smart autoindenting when starting a new line

vim.o.completeopt = 'menuone,noselect' --> set complete opt to have better completion experience

vim.o.conceallevel = 0                 --> so that `` is visible in markdown files

vim.o.encoding = 'utf-8'               --> encoding

vim.o.background = 'dark'
vim.o.termguicolors = true

vim.o.cursorline = true --> highlight current line
vim.o.cursorcolumn = false

vim.o.scrolloff = 15
vim.o.sidescrolloff = 15

vim.o.laststatus = 3

vim.o.showmode = false
vim.o.showcmd = true

vim.o.splitbelow = true --> force horizontal splits to go below
vim.o.splitright = true --> force vertical splits to go right

vim.o.list = true
vim.opt.listchars:append('tab:> ')

vim.opt.shortmess:append('c')
vim.opt.whichwrap:append('<,>,[,],h,l')
vim.opt.iskeyword:append('-')
