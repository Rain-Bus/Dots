local conf = require("plugins.lang.conf")
local plugin = require("plugins").register

plugin({ "nvim-treesitter/nvim-treesitter", lazy = false, build = ":TSUpdate", config = conf.treesitter })

plugin({ "mfussenegger/nvim-dap", config = conf.dap, dependencies = { "nvim-neotest/nvim-nio" } })

plugin({
  "saghen/blink.cmp",
  build = function()
    require("blink.cmp").build():pwait()
  end,
  dependencies = {
    { "saghen/blink.lib" },
    { "rafamadriz/friendly-snippets" },
    { "giuxtaposition/blink-cmp-copilot" },
  },
  opts = conf.blink,
})
plugin({ "zbirenbaum/copilot.lua", event = "InsertEnter", opts = conf.copilot })

plugin({
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    conf.mason()
    conf.lsp()
  end,
})

plugin({ "stevearc/conform.nvim", event = "BufWritePre", config = conf.conform })
