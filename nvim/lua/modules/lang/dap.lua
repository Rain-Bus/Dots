local dap = require('dap')

local data_path = require('core.helper').get_data_path()

local adapters = {
    cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        command = data_path .. '/mason/bin/OpenDebugAD7',
    },
    go = {
        id = 'go',
        type = 'executable',
        command = data_path .. '/mason/bin/go-debug-adapter',
    },
    python = {
        id = 'python',
        type = 'executable',
        command = data_path .. '/mason/bin/debugpy',
    },
}

local configurations = {
    cpp = {
        {
            name = 'Launch file',
            type = 'cppdbg',
            request = 'launch',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = '${workspaceFolder}',
            stopAtEntry = true,
        },
        {
            name = 'Attach to gdbserver :1234',
            type = 'cppdbg',
            request = 'launch',
            MIMode = 'gdb',
            miDebuggerServerAddress = 'localhost:1234',
            miDebuggerPath = '/usr/bin/gdb',
            cwd = '${workspaceFolder}',
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
        },
    },
    go = {
        {
            type = 'go',
            name = 'Debug',
            request = 'launch',
            showLog = false,
            program = '${file}',
            dlvToolPath = data_path .. '/mason/bin/dlv',
        },
    },
    python = {
        {
            type = 'python',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            pythonPath = function()
                local cwd = vim.fn.getcwd()
                if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                    return cwd .. '/venv/bin/python'
                elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                    return cwd .. '/.venv/bin/python'
                else
                    return '/usr/bin/python'
                end
            end,
        },
    },
}

configurations['c'] = configurations.cpp
configurations['rust'] = configurations.cpp

for name, adapter in pairs(adapters) do
    dap.adapters[name] = adapter
end
for name, configuration in pairs(configurations) do
    dap.configurations[name] = configuration
end
