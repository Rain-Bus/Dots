local M = {}
function M.treesitter()
  local parsers = {
    "c", "css", "lua", "rust", "go", "java",
    "javascript", "typescript", "html", "json",
    "markdown", "markdown_inline", "python", "vue",
    "yaml", "toml", "tsx", "vim", "vimdoc",
  }
  require("nvim-treesitter").install(parsers)
  vim.api.nvim_create_autocmd("FileType", {
    pattern = parsers,
    callback = function()
      vim.treesitter.start()
    end,
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
    fuzzy = { implementation = "prefer_rust_with_warning" },
  }
end

function M.copilot()
  return {}
end

function M.mason()
  local lsp = require("plugins.lang.lsp").names()
  local nuls = require("plugins.lang.nuls").names()
  local dap = require("plugins.lang.dap").names()
  return {
    ensure_installed = vim.list_extend(lsp, vim.list_extend(nuls, dap)),
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
