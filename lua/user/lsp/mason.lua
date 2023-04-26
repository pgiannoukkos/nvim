local mason_status_ok, mason = pcall(require, 'mason')
if not mason_status_ok then
    return
end

mason.setup({
    ui = {
        border = 'rounded',
        icons = {
            package_installed = '✓',
            package_pending = '➜',
            package_uninstalled = '✗',
        },
    },
})

local mason_lspconfig_status_ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not mason_lspconfig_status_ok then
    return
end

mason_lspconfig.setup({
    ensure_installed = { 'clangd', 'cmake', 'lua_ls', 'rust_analyzer', 'pylsp', 'bashls' },
    automatic_installation = false,
})
