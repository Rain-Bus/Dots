local plugin = require('core.pack').register_plugin
local conf = require('modules.lang.config')

plugin({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = conf.treesitter })

plugin({ 'williamboman/mason-lspconfig.nvim', config = conf.masonlsp })
plugin({ 'williamboman/mason.nvim', config = conf.mason })
plugin({ 'neovim/nvim-lspconfig', config = conf.lsp })

plugin({ 'mfussenegger/nvim-dap', config = conf.dap })

plugin({ 'jose-elias-alvarez/null-ls.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = conf.null_ls })

plugin({
    'hrsh7th/nvim-cmp',
    config = conf.cmp,
    requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-cmdline' },
        { 'saadparwaiz1/cmp_luasnip' },
    },
})

plugin({ 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*' })

plugin({ 'simrat39/rust-tools.nvim', config = conf.rust_tools })
