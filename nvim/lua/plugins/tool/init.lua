local plugin = require("plugins").register
local conf = require("plugins.tool.conf")

plugin({
  "nvim-telescope/telescope.nvim",
  branch = "master", -- TODO: 等 v0.3.x release 后改回 version = "*"
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    "debugloop/telescope-undo.nvim",
    "tsakirist/telescope-lazy.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
  },
  opts = conf.telescope,
})

plugin({ "akinsho/toggleterm.nvim", version = "*", opts = conf.toggleterm })

plugin({ "folke/which-key.nvim", opts = conf.whichkey })

plugin({ "folke/flash.nvim", event = "VeryLazy", opts = {} })
