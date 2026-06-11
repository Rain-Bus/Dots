local M = {}

local N = {}

-- Auto-detect Python interpreter: $VIRTUAL_ENV > .venv in project > conda > fallback
local function get_python_path()
  local venv = os.getenv("VIRTUAL_ENV")
  if venv then
    return venv .. "/bin/python"
  end
  local found = vim.fs.find(".venv", {
    path = vim.fn.getcwd(),
    upward = true,
    type = "directory",
    stop = vim.env.HOME,
  })
  if #found > 0 then
    return found[1] .. "/bin/python"
  end
  local conda = os.getenv("CONDA_PREFIX")
  if conda then
    return conda .. "/bin/python"
  end
  return "python3"
end

local servers = {
  lua_ls = {
    mason = "lua-language-server",
    settings = {
      -- Lua = {
      --   runtime = {
      --     version = "LuaJIT",
      --   },
      --   diagnostics = {
      --     globals = { "vim" },
      --   },
      --   workspace = {
      --     library = vim.api.nvim_get_runtime_file("", true),
      --     checkThirdParty = false,
      --   },
      --   telemetry = {
      --     enable = false,
      --   },
      -- },
    },
  },
  gopls = {
    settings = {
      analyses = {
        unusewrites = true,
        unusedparams = true,
        nilness = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
  clangd = {},
  rust_analyzer = {
    mason = "rust-analyzer",
  },
  ty = {
    cmd = { "ty", "server" },
    filetypes = { "python" },
  },
  jdtls = {
    bundles = {
      vim.fn.glob(
        vim.fn.stdpath("data")
          .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar",
        1
      ),
    },
  },
  verible = {},

  -- Front
  html = { mason = "html-lsp" },
  cssls = { mason = "css-lsp" },
  ts_ls = { mason = "typescript-language-server" },
  vue_ls = { mason = "vue-language-server" },

  -- Conf
  jsonls = {
    mason = "json-lsp",
    flags = { debounce_text_changes = 500 },
    init_options = { provideFormatter = false },
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { "package.json" },
            url = "https://json.schemastore.org/package.json",
          },
          {
            fileMatch = { "tsconfig*.json" },
            url = "https://json.schemastore.org/tsconfig.json",
          },
          {
            fileMatch = { ".eslintrc", ".eslintrc.json" },
            url = "https://json.schemastore.org/eslintrc.json",
          },
          {
            fileMatch = { "/.github/workflows/*" },
            url = "https://json.schemastore.org/github-workflow.json",
          },
        },
      },
    },
  },
  yamlls = {
    mason = "yaml-language-server",
    settings = {
      yaml = {
        schemas = {
          ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        },
      },
    },
  },
  taplo = {},
  lemminx = {},
  marksman = {},
  cmake = { mason = "cmake-language-server" },
}

function N.icons()
  local icons = require("config.icons")
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
        [vim.diagnostic.severity.WARN] = icons.diagnostics.Warn,
        [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
        [vim.diagnostic.severity.INFO] = icons.diagnostics.Info,
      },
    },
    virtual_text = icons.virtual,
  })
end

function M.names()
  local res = {}
  for name, conf in pairs(servers) do
    table.insert(res, conf.mason or name)
  end
  return res
end

function M.setup()
  local capabilities = require("blink.cmp").get_lsp_capabilities()
  N.icons()
  for k, v in pairs(servers) do
    v.on_attach = N.custom_attach
    v.capabilities = capabilities
    -- dynamically detect Python venv at config time
    if v.detect_venv then
      v.settings = vim.tbl_deep_extend("force", v.settings or {}, {
        python = { pythonPath = get_python_path() },
      })
      v.detect_venv = nil
    end
    vim.lsp.config(k, v)
    vim.lsp.enable(k)
  end
end

---@param client lsp.Client
N.custom_attach = function(client, bufnr)
  require("plugins.innerkeymap").lsp(bufnr)
end

return M
