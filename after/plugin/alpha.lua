local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
    return
end

local dashboard = require('alpha.themes.dashboard')

dashboard.section.buttons.val = {
    dashboard.button('e', '  New file', ':lua vim.cmd.ene()<CR>'),
    dashboard.button('f', '  Find file', ':Telescope find_files<CR>'),
    dashboard.button('p', '  Find project', ':Telescope projects<CR>'),
    dashboard.button('r', '  Recently used files', ':Telescope oldfiles<CR>'),
    dashboard.button('c', '  Configuration', ':e $MYVIMRC<CR>'),
    dashboard.button('q', '  Quit Neovim', ':qa<CR>'),
}

dashboard.section.footer.val = 'pgiannoukkos.github.io'

dashboard.section.footer.opts.hl = 'Type'
dashboard.section.header.opts.hl = 'Include'
dashboard.section.buttons.opts.hl = 'Keyword'

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)
