return {
    'goolord/alpha-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        local alpha = require('alpha')

        local dashboard = require('alpha.themes.dashboard')

        dashboard.section.buttons.val = {
            dashboard.button('e', '  New file', ':lua vim.cmd.ene()<CR>'),
            dashboard.button('f', '󰈞  Find file', ':Telescope find_files<CR>'),
            dashboard.button('p', '  Find project', ':Telescope projects<CR>'),
            dashboard.button('r', '󰄉  Recently used files', ':Telescope oldfiles<CR>'),
            dashboard.button('c', '  Configuration', ':e $MYVIMRC<CR>'),
            dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
        }

        dashboard.section.footer.val = 'https://github.com/pgiannoukkos'

        dashboard.section.footer.opts.hl = 'Type'
        dashboard.section.header.opts.hl = 'Include'
        dashboard.section.buttons.opts.hl = 'Keyword'

        dashboard.opts.opts.noautocmd = true

        alpha.setup(dashboard.opts)
    end,
}
