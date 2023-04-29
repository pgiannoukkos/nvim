return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'c', 'cpp', 'cmake', 'lua', 'rust', 'python', 'vim', 'vimdoc' },
            sync_install = false,
            auto_install = false,
            ignore_install = {},
            highlight = {
                enable = true,
                disable = {},
                additional_vim_regex_highlighting = false,
            },
        })
    end,
}
