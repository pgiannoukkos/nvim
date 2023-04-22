local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer.lua source <afile> | PackerSync
augroup end
]])

return packer.startup({
    function(use)
        use('wbthomason/packer.nvim')

        -- LSP
        use({
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
            'neovim/nvim-lspconfig',
        })

        -- Autocompletion
        use('hrsh7th/cmp-nvim-lsp')
        use('hrsh7th/cmp-nvim-lua')
        use('hrsh7th/cmp-buffer')
        use('hrsh7th/cmp-path')
        use('hrsh7th/cmp-cmdline')
        use('hrsh7th/nvim-cmp')

        -- Snippets
        use('L3MON4D3/LuaSnip') --> snippet engine
        use('saadparwaiz1/cmp_luasnip') --> snippet completions
        use('rafamadriz/friendly-snippets') --> a bunch o snippets

        -- Formatring and Linting
        use('jose-elias-alvarez/null-ls.nvim')

        use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' }) --> Treesitter for better syntax highlight
        use('folke/tokyonight.nvim') --> TokyoNight colorscheme
        use({ 'ellisonleao/gruvbox.nvim' })

        use({
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
            requires = { { 'nvim-lua/plenary.nvim' } },
        })

        use('goolord/alpha-nvim')
        use('christoomey/vim-tmux-navigator') --> tmux & split window navigation
        use('windwp/nvim-autopairs') --> Autopairs
        use('numToStr/Comment.nvim') --> Commenting
        use('nvim-tree/nvim-tree.lua') --> Nvim Tree
        use('nvim-tree/nvim-web-devicons') --> Devicons
        use('nvim-lualine/lualine.nvim') --> Lualine
        use({ 'akinsho/bufferline.nvim', tag = 'v3.*' })
        use('lukas-reineke/indent-blankline.nvim')
        use({ 'lewis6991/gitsigns.nvim', tag = 'release' })
        use('moll/vim-bbye')

        -- Automatically set up your configuration after cloning packer.nvim
        -- Put this at the end after all plugins
        if packer_bootstrap then
            require('packer').sync()
        end
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'rounded' })
            end,
        },
    },
})
