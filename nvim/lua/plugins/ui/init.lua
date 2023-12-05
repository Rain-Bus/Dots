local plugin = require("plugins").register
local conf = require("plugins.ui.conf")

plugin({ "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = conf.catppuccin })
plugin({ "rebelot/kanagawa.nvim", priority = 1000, opts = conf.kanagawa })
plugin({ "EdenEast/nightfox.nvim", priority = 1000, opts = conf.nightfox })
plugin({ "folke/tokyonight.nvim", priority = 1000, opts = conf.tokyonight })

plugin({ "nvim-tree/nvim-web-devicons", lazy = true })

plugin({
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = conf.nvim_tree,
})

plugin({
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = conf.bufferline,
})

plugin({
  "nvim-lualine/lualine.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = conf.lualine,
})

plugin({
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = conf.dashboard,
})

plugin({ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = conf.todo })

plugin({ "lukas-reineke/indent-blankline.nvim", main = "ibl", config = conf.indent })

plugin({ "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" }, opts = conf.dapui })

plugin({
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  opts = conf.lspsaga,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
  },
})
plugin({ "ray-x/lsp_signature.nvim", opts = conf.signature })
plugin({ "folke/trouble.nvim", dependencies = "nvim-tree/nvim-web-devicons", opts = conf.trouble })
