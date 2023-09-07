local M = {}
function M.treesitter()
  require("nvim-treesitter.configs").setup({
    modules = {},
    ignore_install = {},
    ensure_installed = {
      "c",
      "css",
      "lua",
      "rust",
      "go",
      "java",
      "javascript",
      "typescript",
      "html",
      "json",
      "markdown",
      "markdown_inline",
      "python",
      "vue",
      "yaml",
      "toml",
      "tsx",
      "toml",
      "vim",
      "vimdoc",
    },
    sync_install = false,
    auto_install = true,
    highlight = {
      enable = true,
    },
  })
end

function M.cmp()
  local cmp = require("cmp")
  cmp.setup({
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
    }),
    mapping = require("plugins.innerkeymap").cmp(),
    formatting = {
      format = function(_, item)
        local icons = require("config.icons").kinds
        item.kind = icons[item.kind] or item.kind
        return item
      end,
    },
  })
  cmp.setup.cmdline({ "/", "?" }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  })
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
      { name = "cmdline" },
    }),
  })
end

function M.mason()
  return {}
end

function M.masonlsp()
  return {
    ensure_installed = require("plugins.lang.lsp").names(),
  }
end

function M.masonuls()
  return {
    ensure_installed = require("plugins.lang.nuls").names(),
  }
end

function M.masondap()
  return {
    ensure_installed = require("plugins.lang.dap").names(),
  }
end

function M.lsp()
  require("plugins.lang.lsp").setup()
end

function M.nuls()
  require("plugins.lang.nuls").setup()
end

function M.dap()
  require("plugins.lang.dap").setup()
end

return M
