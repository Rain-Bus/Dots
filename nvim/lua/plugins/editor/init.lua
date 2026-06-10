local conf = require("plugins.editor.conf")
local plugin = require("plugins").register

plugin({ "windwp/nvim-autopairs", event = "InsertEnter", opts = conf.autopair })
plugin({ "windwp/nvim-ts-autotag", event = "InsertEnter", opts = conf.autotag })
