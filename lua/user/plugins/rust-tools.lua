return {
    'simrat39/rust-tools.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'nvim-lua/plenary.nvim',
        'mfussenegger/nvim-dap',
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        local rt = require('rust-tools')

        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        rt.setup({
            server = {
                capabilities = capabilities,
                cmd = { 'rustup', 'run', 'stable', 'rust-analyzer' },
                on_attach = function(_, bufnr)
                    -- Enable completion triggered by <c-x><c-o>
                    vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    -- Buffer local mappings.
                    -- See `:help vim.lsp.*` for documentation on any of the below functions
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = bufnr, desc = '[R]e[n]ame' })
                    vim.keymap.set(
                        'n',
                        '<leader>ca',
                        rt.code_action_group.code_action_group,
                        { buffer = bufnr, desc = '[C]ode [A]ction' }
                    )
                    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = bufnr, desc = '[G]oto [D]efinition' })
                    vim.keymap.set(
                        'n',
                        'gr',
                        require('telescope.builtin').lsp_references,
                        { buffer = bufnr, desc = '[G]oto [R]eferences' }
                    )
                    vim.keymap.set(
                        'n',
                        'gI',
                        vim.lsp.buf.implementation,
                        { buffer = bufnr, desc = '[G]oto [I]mplementation' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>D',
                        vim.lsp.buf.type_definition,
                        { buffer = bufnr, desc = 'Type [D]efinition' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>ds',
                        require('telescope.builtin').lsp_document_symbols,
                        { buffer = bufnr, desc = '[D]ocument [S]ymbols' }
                    )
                    vim.keymap.set(
                        'n',
                        '<leader>ws',
                        require('telescope.builtin').lsp_dynamic_workspace_symbols,
                        { buffer = bufnr, desc = '[W]orkspace [S]ymbols' }
                    )
                    vim.keymap.set(
                        'n',
                        'K',
                        rt.hover_actions.hover_actions,
                        { buffer = bufnr, desc = 'Hover Documentation' }
                    )
                    vim.keymap.set(
                        'n',
                        '<C-k>',
                        vim.lsp.buf.signature_help,
                        { buffer = bufnr, desc = 'Signature Documentation' }
                    )
                    -- Lesser used LSP functionality
                    vim.keymap.set(
                        'n',
                        'gD',
                        vim.lsp.buf.declaration,
                        { buffer = bufnr, desc = '[G]oto [D]eclaration' }
                    )
                    -- Create a command `:Format` local to the LSP buffer
                    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                        vim.lsp.buf.format()
                    end, { desc = 'Format current buffer with LSP' })
                end,
            },
            tools = {
                hover_actions = {
                    auto_focus = true,
                },
            },
        })
    end,
}
