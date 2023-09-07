local conf = require("plugins.lang.conf")
local plugin = require("plugins").register

plugin({ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", opts = conf.treesitter })

plugin({ "mfussenegger/nvim-dap", config = conf.dap })

plugin({ "L3MON4D3/LuaSnip", version = "1.*", build = "make install_jsregexp" })

plugin({
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = conf.cmp,
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-cmdline" },
    { "saadparwaiz1/cmp_luasnip" },
  },
})

plugin({ "neovim/nvim-lspconfig", event = { "BufReadPre", "BufNewFile" }, config = conf.lsp })

plugin({ "jose-elias-alvarez/null-ls.nvim", opts = conf.nuls })
plugin({ "williamboman/mason.nvim", build = ":MasonUpdate", opts = conf.mason })
plugin({
  "williamboman/mason-lspconfig.nvim",
  opts = conf.masonlsp,
  dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
})
plugin({
  "jay-babu/mason-null-ls.nvim",
  opts = conf.masonuls,
  dependencies = { "williamboman/mason.nvim", "jose-elias-alvarez/null-ls.nvim" },
})
plugin({
  "jay-babu/mason-nvim-dap.nvim",
  opts = conf.masondap,
  dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
})
