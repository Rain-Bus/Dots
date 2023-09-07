local M = {}
local N = {}

local adapters = {
  cppdbg = {
    lang = { "c", "cpp", "rust" },
    id = "cppdbg",
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
  },
  go = {
    lang = "go",
    id = "go",
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/go-debug-adapter",
  },
  python = {
    lang = "python",
    id = "python",
    type = "executable",
    command = vim.fn.stdpath("data") .. "/mason/bin/debugpy-adapter",
  },
}

local configs = {
  cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
      stopAtEntry = true,
    },
    {
      name = "Attach to gdbserver :1234",
      type = "cppdbg",
      request = "launch",
      MIMode = "gdb",
      miDebuggerServerAddress = "localhost:1234",
      miDebuggerPath = "/usr/bin/gdb",
      cwd = "${workspaceFolder}",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
    },
  },
  go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      showLog = false,
      program = "${file}",
      dlvToolPath = vim.fn.stdpath("data") .. "/mason/bin/dlv",
    },
  },
  python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
      pythonPath = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. "/venv/bin/python") == 1 then
          return cwd .. "/venv/bin/python"
        elseif vim.fn.executable(cwd .. "/.venv/bin/python") == 1 then
          return cwd .. "/.venv/bin/python"
        else
          return "/usr/bin/python"
        end
      end,
    },
  },
}

function M.names()
  local res = {}
  for _, v in pairs(adapters) do
    table.insert(res, v.id)
  end
  return res
end

function M.setup()
  local dap = require("dap")
  for k, v in pairs(adapters) do
    if v.disable then
      goto continue
    end
    dap.adapters[k] = v
    local lang = v.lang
    if type(lang) == "table" then
      for _, e in ipairs(lang) do
        dap.configurations[e] = configs[e]
      end
    elseif type(lang) == "string" then
      dap.configurations[lang] = configs[lang]
    end
    ::continue::
  end
  N.dapui()
  N.dapsign()
end

function N.dapui()
  local dap, dapui = require("dap"), require("dapui")
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open({})
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close({})
  end
  dap.listeners.before.disconnect["dapui_config"] = function()
    dapui.close({})
  end
end

function N.dapsign()
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
end

return M
