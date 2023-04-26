local fn = vim.fn
local lazypath = fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
    return
end

local plugins = {
    -- LSP
    { 'folke/neodev.nvim' },
    { 'williamboman/mason.nvim', build = ':MasonUpdate' }, --> :MasonUpdate updates registry contents
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'ray-x/lsp_signature.nvim' },

    -- Completions
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-nvim-lua' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'windwp/nvim-autopairs' },

    -- Snippets
    { 'L3MON4D3/LuaSnip' }, --> snippet engine
    { 'saadparwaiz1/cmp_luasnip' }, --> snippet completions
    { 'rafamadriz/friendly-snippets' }, --> a bunch of snippets

    -- Formatting and Linting
    { 'jose-elias-alvarez/null-ls.nvim' },

    -- Telescope
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.1',
        dependencies = 'nvim-lua/plenary.nvim',
    },
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },

    -- colorschemese
    { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' }, --> for better syntax highlighting
    { 'folke/tokyonight.nvim', lazy = false, priority = 1000 },
    { 'ellisonleao/gruvbox.nvim' },

    -- Nvim Tree
    {
        'nvim-tree/nvim-tree.lua',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },

    -- Misc
    { 'goolord/alpha-nvim' }, --> greeter
    { 'christoomey/vim-tmux-navigator' }, --> tmux & split window navigation
    { 'numToStr/Comment.nvim' }, --> commenting
    { 'nvim-lualine/lualine.nvim', dependencies = 'nvim-tree/nvim-web-devicons' }, --> status line
    {
        'akinsho/bufferline.nvim',
        version = '*',
        dependencies = 'nvim-tree/nvim-web-devicons',
    },
    { 'lukas-reineke/indent-blankline.nvim' },
    { 'lewis6991/gitsigns.nvim' },
    { 'moll/vim-bbye' },
}

local opts = {}

lazy.setup(plugins, opts)
