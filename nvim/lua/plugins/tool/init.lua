local plugin = require("plugins").register
local conf = require("plugins.tool.conf")

plugin({ "nvim-telescope/telescope.nvim", branch = "0.1.x", requires = "nvim-lua/plenary.nvim", opts = conf.telescope })
plugin({ "nvim-telescope/telescope-fzf-native.nvim", build = "make" })
plugin({ "nvim-telescope/telescope-ui-select.nvim" })
plugin({ "nvim-telescope/telescope-dap.nvim" })
plugin({ "nvim-telescope/telescope-project.nvim" })

plugin({ "akinsho/toggleterm.nvim", version = "*", opts = conf.toggleterm })

plugin({ "folke/which-key.nvim", opts = conf.whichkey })

plugin({ "folke/flash.nvim", event = "VeryLazy", opts = {} })
