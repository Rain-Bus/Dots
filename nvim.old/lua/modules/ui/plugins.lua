local plugin = require('core.pack').register_plugin
local conf = require('modules.ui.config')

-- plugin({ 'folke/tokyonight.nvim', config = conf.tokyonight })

-- plugin({ "navarasu/onedark.nvim", config = conf.onedark })
-- plugin({ 'EdenEast/nightfox.nvim', config = conf.nightfox })
plugin({ 'catppuccin/nvim', as = "catppuccin", config = conf.catppuccin})
plugin({ 'nvim-lualine/lualine.nvim', config = conf.lualine })
plugin({
    'nvim-tree/nvim-tree.lua',
    config = conf.nvim_tree,
    requires = { 'nvim-tree/nvim-web-devicons', 'arkav/lualine-lsp-progress' },
})

--plugin({ "nanozuki/tabby.nvim", config = conf.tabby })
plugin({
    'akinsho/bufferline.nvim',
    tag = 'v3.*',
    requires = 'nvim-tree/nvim-web-devicons',
    config = conf.bufferline,
})
plugin({ 'glepnir/dashboard-nvim', config = conf.dashboard })

plugin({ 'onsails/lspkind.nvim', config = conf.lspkind })
plugin({ 'glepnir/lspsaga.nvim', branch = 'main', config = conf.lspsaga })
plugin({ 'ray-x/lsp_signature.nvim', config = conf.signature })

plugin({ 'folke/todo-comments.nvim', require = 'nvim-lua/plenary.nvim', config = conf.todo })

plugin({ 'lukas-reineke/indent-blankline.nvim', config = conf.indent })

plugin({ 'rcarriga/nvim-dap-ui', config = conf.dapui })

plugin({ 'folke/trouble.nvim', config = conf.trouble })

-- folke/styler.nvim
-- anuvyklack/windows.nvim
