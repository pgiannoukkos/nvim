return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
        'MunifTanjim/nui.nvim',
    },
    opts = {
        window = {
            position = 'left',
            width = 30,
        },
        filesystem = {
            hijack_netrw_behavior = 'open_current',
        },
    },
}
