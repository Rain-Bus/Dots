local plugin = require('core.pack').register_plugin
local conf = require('modules.editor.config')

plugin({ "windwp/nvim-autopairs", config = conf.autopair })
plugin({ "windwp/nvim-ts-autotag", config = conf.autotag })
plugin({ "Pocco81/auto-save.nvim", config = conf.autosave })
plugin({ "numToStr/Comment.nvim", config = conf.comment })
-- plugin({ "folke/neoconf.nvim", config = conf.neoconf })
