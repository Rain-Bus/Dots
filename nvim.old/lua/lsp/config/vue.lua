local lsp_util = require("lspconfig.util")

local opts = {
  cmd = { "vue-language-server", "--stdio" },
  filetypes = { "vue" },
  root_dir = lsp_util.root_pattern("package.json", "vue.config.js"),
  init_options = {
    documentFeatures = {
      documentColor = false,
      documentFormatting = {
        defaultPrintWidth = 100
      },
      documentSymbol = true,
      foldingRange = true,
      linkedEditingRange = true,
      selectionRange = true
    },
    languageFeatures = {
      callHierarchy = true,
      codeAction = true,
      codeLens = true,
      completion = {
        defaultAttrNameCase = "kebabCase",
        defaultTagNameCase = "both"
      },
      definition = true,
      diagnostics = true,
      documentHighlight = true,
      documentLink = true,
      hover = true,
      implementation = true,
      references = true,
      rename = true,
      renameFileRefactoring = true,
      schemaRequestService = true,
      semanticTokens = false,
      signatureHelp = true,
      typeDefinition = true
    },
    typescript = {
      serverPath = "/home/fallen-angle/.local/share/nvim/lsp_servers/tsserver/node_modules/.bin/typescript-language-server"
    },
  }
}
return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
