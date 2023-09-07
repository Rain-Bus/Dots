local plugin = require("plugins").register
local conf = require("plugins.tool.conf")

plugin({ "nvim-telescope/telescope.nvim", tag = "0.1.1", requires = "nvim-lua/plenary.nvim", opts = conf.telescope })
plugin({ "ahmedkhalf/project.nvim", name = "project_nvim", opts = conf.project })
plugin({ "nvim-telescope/telescope-fzf-native.nvim", build = "make" })
plugin({ "nvim-telescope/telescope-ui-select.nvim" })
plugin({ "nvim-telescope/telescope-dap.nvim" })

plugin({ "akinsho/toggleterm.nvim", version = "*", opts = conf.toggleterm })

plugin({ "folke/which-key.nvim", opts = conf.whichkey })
