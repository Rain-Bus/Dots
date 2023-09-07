local nvim_lsp = require('lspconfig')
local lsp_util = require('lspconfig/util')
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local data_path = require('core.helper').get_data_path()

require('lspconfig.ui.windows').default_options.border = 'single'

local configmap = {
  -- Backend
  ['lua_ls'] = {
    settings = {
      Lua = {
        runtime = {
          version = 'LuaJIT',
        },
        diagnostics = {
          globals = { 'vim' },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file('', true),
          checkThirdParty = false,
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },
  ['gopls'] = {
    format_on_save = true,
    cmd = { 'gopls', 'serve' },
    filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
    root_dir = lsp_util.root_pattern('go.work', 'go.mod', '.git'),
    single_file_support = true,
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
  --[[ ['rust_analyzer'] = {
    format_on_save = true,
    settings = {
      ['rust-analyzer'] = {
        imports = {
          granularity = {
            group = 'module',
          },
          prefix = 'self',
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  }, ]]
  ['clangd'] = {
    capabilities = vim.tbl_deep_extend('keep', { offsetEncoding = { 'utf-16', 'utf-8' } }, capabilities),
  },
  ['pyright'] = {
    settings = {},
  },
  ['jdtls'] = {
    format_with_ls = true,
    init_options = {
      bundles = {
        vim.fn.glob(data_path .. '/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar', 1),
      },
    },
  },

  -- Front
  ['html'] = {},
  ['cssls'] = {},
  ['tsserver'] = {},
  ['volar'] = {
    init_options = {
      typescript = {
        tsdk = { data_path .. '/mason/packages/typescript-language-server/node_modules/typescript/lib' },
      },
    },
  },

  -- Conf
  ['jsonls'] = {
    flags = { debounce_text_changes = 500 },
    init_options = { provideFormatter = false },
    settings = {
      json = {
        schemas = {
          {
            fileMatch = { 'package.json' },
            url = 'https://json.schemastore.org/package.json',
          },
          {
            fileMatch = { 'tsconfig*.json' },
            url = 'https://json.schemastore.org/tsconfig.json',
          },
          {
            fileMatch = { '.eslintrc', '.eslintrc.json' },
            url = 'https://json.schemastore.org/eslintrc.json',
          },
          {
            fileMatch = { '/.github/workflows/*' },
            url = 'https://json.schemastore.org/github-workflow.json',
          },
        },
      },
    },
  },
  ['yamlls'] = {
    settings = {
      yaml = {
        schemas = {
          ['https://json.schemastore.org/github-workflow.json'] = '/.github/workflows/*',
        },
      },
    },
  },
  ['taplo'] = {},
  ['lemminx'] = {},
  ['marksman'] = {},
}

local function custom_attach(client, bufnr)
  if not configmap[client.name].format_with_ls then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  end
  require('keymap.config').lsp(bufnr)
  if client.supports_method('textDocument/formatting') and configmap[client.name].format_on_save then
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

for _, server in ipairs(require('mason-lspconfig').get_installed_servers()) do
  if configmap[server] then
    configmap[server].on_attach = custom_attach
    nvim_lsp[server].setup(configmap[server])
  end
end

local lsp = {}
lsp.custom_attach = custom_attach
return lsp
