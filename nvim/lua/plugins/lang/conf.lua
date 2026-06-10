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

function M.blink()
  local icons = require("config.icons").kinds
  return {
    keymap = {
      preset = "super-tab",
      ["<C-o>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-space>"] = {},
    },
    appearance = {
      nerd_font_variant = "mono",
      kind_icons = icons,
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer", "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-cmp-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      list = { selection = { preselect = true } },
    },
    signature = { enabled = true },
    fuzzy = { implementation = "rust" },
  }
end

function M.copilot()
  return {}
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
