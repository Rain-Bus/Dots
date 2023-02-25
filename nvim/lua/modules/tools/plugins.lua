local plugin = require('core.pack').register_plugin
local conf = require('modules.tools.config')

plugin({ 'akinsho/toggleterm.nvim', tag = '*', config = conf.toggleterm })
plugin({
    'nvim-telescope/telescope.nvim',
    tag = '0.1.0',
    requires = 'nvim-lua/plenary.nvim',
    config = conf.telescope,
})
plugin({ 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' })
plugin({ 'ahmedkhalf/project.nvim', config = conf.project })
plugin({ 'nvim-telescope/telescope-dap.nvim' })
plugin({ 'nvim-telescope/telescope-ui-select.nvim' })

plugin({ 'folke/which-key.nvim', config = conf.whichkey })

plugin({ 'ojroques/nvim-osc52', config = conf.osc52 })
