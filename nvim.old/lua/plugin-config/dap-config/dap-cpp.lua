local dap = require('dap')

dap.adapters.cppdbg = {
    id = 'cppdbg',
    type = "executable",
    command = os.getenv('HOME') .. '/.local/share/nvim/debugger/vs-cpptools/extension/debugAdapters/bin/OpenDebugAD7',
}
dap.configurations.cpp = {
    {
        name = "Launch file",
        type = "cppdbg",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = true,
        setupCommands = {
            {
                description = 'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false
            },
        },
    },
    {
        name = "Attach process",
        type = "cppdbg",
        request = "attach",
        processId = require('dap.utils').pick_process,
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = "${workspaceFolder}",
        setupCommands = {
            {
                description = 'enable pretty printing',
                text = '-enable-pretty-printing',
                ignoreFailures = false
            },
        },
    },
    {
        name = 'Attach to gdbserver :1234',
        type = 'cppdbg',
        request = 'launch',
        MIMode = 'gdb',
        miDebuggerServerAddress = 'localhost:1234',
        miDebuggerPath = '/usr/bin/gdb', cwd = '${workspaceFolder}',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        setupCommands = {
            {
                text = '-enable-pretty-printing',
                description = 'enable pretty printing',
                ignoreFailures = false
            },
        },
    },
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
