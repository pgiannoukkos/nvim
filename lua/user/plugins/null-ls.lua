return {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
        local null_ls = require('null-ls')

        null_ls.setup({
            sources = {
                -- Formatters
                null_ls.builtins.formatting.stylua,  -- lua
                null_ls.builtins.formatting.rustfmt, -- rust
                null_ls.builtins.formatting.black,   -- python

                -- Linters
                null_ls.builtins.diagnostics.flake8, -- python
            },
        })
    end,
}
