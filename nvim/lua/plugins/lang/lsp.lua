local M = {}

local N = {}

local servers = {
  lua_ls = {
    format_on_save = true,
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
    format_on_save = true,
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
    format_on_save = true,
  },
  pyright = {},
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
  html = {},
  cssls = {},
  ts_ls = {},
  vue_ls = {},

  -- Conf
  jsonls = {
    format_on_save = true,
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
    format_on_save = true,
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
  cmake = {},
}

function N.icons()
  for k, v in pairs(require("config.icons").diagnostics) do
    local name = "DiagnosticSign" .. k
    vim.fn.sign_define(name, { text = v, texthl = name, numhl = "" })
  end
  vim.diagnostic.config({ virtual_text = require("config.icons").virtual })
end

function M.names()
  local res = {}
  for name, _ in pairs(servers) do
    table.insert(res, name)
  end
  return res
end

function M.setup()
  -- local lspconfig = require("lspconfig")
  -- local lspconfig = vim.lsp.config
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  N.icons()
  for k, v in pairs(servers) do
    v.on_attach = N.custom_attach
    v.capabilities = capabilities
    -- lspconfig[k].setup(v)
    vim.lsp.config(k, v)
  end
end

---@param client lsp.Client
N.custom_attach = function(client, bufnr)
  require("plugins.innerkeymap").lsp(bufnr)
  if client.config.format_with_lsp ~= true and client:supports_method("textDocument/formatting") then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
  if client.config.format_on_save == true and client:supports_method("textDocument/formatting") then
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

return M
