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

plugin({ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" }, config = conf.lsp })

plugin({ "nvimtools/none-ls.nvim", opts = conf.nuls })
plugin({ "williamboman/mason.nvim", build = ":MasonUpdate", opts = conf.mason })
plugin({
  "williamboman/mason-lspconfig.nvim",
  opts = conf.masonlsp,
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
})
plugin({
  "jay-babu/mason-null-ls.nvim",
  opts = conf.masonuls,
  dependencies = { "williamboman/mason.nvim", "nvimtools/none-ls.nvim" },
})
plugin({
  "jay-babu/mason-nvim-dap.nvim",
  opts = conf.masondap,
  dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
})
