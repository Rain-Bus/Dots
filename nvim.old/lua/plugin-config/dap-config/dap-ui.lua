local ok_status, dapui = pcall(require, 'dapui')
if not ok_status then
    vim.notify('Not find bufferline')
    return
end
local ok_status1, dap = pcall(require, "dap")
if not ok_status1 then
    vim.notify("Not find dap")
    return
end

dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },
    mapping = require("keybindings").dapui,
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.35 },
                { id = "stacks", size = 0.35 },
                { id = "watches", size = 0.15 },
                { id = "breakpoints", size = 0.15 },
            },
            size = 40,
            position = "left",
        },
        {
            elements = { "repl" },
            size = 5,
            position = "bottom", -- Can be "left", "right", "top", "bottom"
        }
    },
    floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mapping = require("keybindings").dapui.float
    },
    windows = { indent = 1 },
})

-- set dap signs
vim.fn.sign_define("DapBreakpoint", {
    text = "ﱣ",
    texthl = "LspDiagnosticsSignError",
    linehl = "",
    numhl = "",
})
vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "LspDiagnosticsSignInformation",
    linehl = "DiagnosticUnderlineInfo",
    numhl = "LspDiagnosticsSignInformation",
})
vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "LspDiagnosticsSignHint",
    linehl = "",
    numhl = "",
})

-- set dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
    vim.api.nvim_command("DapVirtualTextEnable")
    -- dapui.close("tray")
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
end
-- for some debug adapter, terminate or exit events will no fire, use disconnect reuest instead
dap.listeners.before.disconnect["dapui_config"] = function()
    vim.api.nvim_command("DapVirtualTextDisable")
    dapui.close()
end
