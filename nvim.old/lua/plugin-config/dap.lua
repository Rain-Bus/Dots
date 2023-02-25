local ok_status, dap = pcall(require, "dap")
if not ok_status then
    vim.notify("Not find dap")
    return
end


require("plugin-config.dap-config.dap-ui")
require("plugin-config.dap-config.dap-virtual-text")


-- set debuggers
dap.defaults.fallback.terminal_win_cmd = '30vsplit new'
dap.set_log_level("DEBUG")
require("plugin-config.dap-config.dap-go")
require("plugin-config.dap-config.dap-cpp")
