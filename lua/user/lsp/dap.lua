local status_ok, dap = pcall(require, 'dap')
if not status_ok then
    return
end

-- keymaps
vim.keymap.set('n', '<F5>', '<cmd>lua require(\'dap\').continue()<CR>')
vim.keymap.set('n', '<F10>', '<cmd>lua require(\'dap\').step_over()<CR>')
vim.keymap.set('n', '<F11>', '<cmd>lua require(\'dap\').step_into()<CR>')
vim.keymap.set('n', '<F12>', '<cmd>lua require(\'dap\').step_out()<CR>')
vim.keymap.set('n', '<leader>b', '<cmd>lua require(\'dap\').toggle_breakpoint()<CR>')
vim.keymap.set('n', '<F5>', '<cmd>lua require(\'dap\').continue()<CR>')

dap.adapters.cppdbg = {
    id = 'cppdgb',
    type = 'executable',
    command = 'C:\\Users\\Panayiotis\\AppData\\Local\\nvim-data\\mason\\packages\\cpptools\\extension\\debugAdapters\\bin\\OpenDebugAD7.exe',
    options = {
        detached = false,
    },
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'cppdbg',
        request = 'launch',
        program = '${workspaceFolder}/bin/testbed.exe',
        cwd = '${workspaceFolder}/bin/',
        stopAtEntry = true,
    },
}

dap.configurations.c = dap.configurations.cpp
