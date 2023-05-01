return {
    'mfussenegger/nvim-dap',
    dependencies = {
        -- Creates a beatiful debugger UI
        'rcarriga/nvim-dap-ui',

        -- Installs the debug adapters
        'williamboman/mason.nvim',
        'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
        local dap = require('dap')
        local dapui = require('dapui')

        require('mason-nvim-dap').setup({
            ensure_installed = { 'cppdbg' },
            automatic_setup = true,
            handlers = {
                function(config)
                    require('mason-nvim-dap').default_setup(config)
                end,
                cppdbg = function(config)
                    config.adapters = {
                        id = 'cppdbg',
                        type = 'executable',
                        command = '/home/py/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
                    }
                    require('mason-nvim-dap').default_setup(config)
                end,
            },
        })

        dap.configurations.c = {
            {
                name = 'Launch file',
                type = 'cppdbg',
                request = 'launch',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = false,
            },
        }
        dap.configurations.cpp = dap.configurations.c

        vim.keymap.set('n', '<F5>', dap.continue)
        vim.keymap.set('n', '<F9>', dap.toggle_breakpoint)
        vim.keymap.set('n', '<F10>', dap.step_over)
        vim.keymap.set('n', '<F11>', dap.step_into)
        vim.keymap.set('n', '<F12>', dap.step_out)

        dapui.setup({
            -- Set icons to characters that are more likely to work in every terminal.
            --    Feel free to remove or use ones that you like more! :)
            --    Don't feel like these are good choices.
            icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
            controls = {
                icons = {
                    pause = '⏸',
                    play = '▶',
                    step_into = '⏎',
                    step_over = '⏭',
                    step_out = '⏮',
                    step_back = 'b',
                    run_last = '▶▶',
                    terminate = '⏹',
                    disconnect = '⏏',
                },
            },
        })

        -- toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
        vim.keymap.set('n', '<F7>', dapui.toggle)

        dap.listeners.after.event_initialized['dapui_config'] = dapui.open
        dap.listeners.before.event_terminated['dapui_config'] = dapui.close
        dap.listeners.before.event_exited['dapui_config'] = dapui.close
    end,
}
