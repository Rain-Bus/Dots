local conf = require("plugins.editor.conf")
local plugin = require("plugins").register

plugin({ "numToStr/Comment.nvim", opts = conf.comment })

plugin({ "windwp/nvim-autopairs", event = "InsertEnter", opts = conf.autopair })
plugin({ "windwp/nvim-ts-autotag", envet = "InsertEnter", opts = conf.autotag })
