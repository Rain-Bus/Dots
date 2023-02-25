-- Packer插件管理配置
local packer = require("packer")
packer.startup({
    function(use)
        use 'wbthomason/packer.nvim'
        -- Themes
        use("shaunsingh/nord.nvim")
        use("navarasu/onedark.nvim")
        use("folke/tokyonight.nvim")
        use("marko-cerovac/material.nvim")
        use("EdenEast/nightfox.nvim")
        -- Nvim Tree
        use({ "kyazdani42/nvim-tree.lua", requires = "kyazdani42/nvim-web-devicons" })
        -- Buffer Line
        use({ "akinsho/bufferline.nvim", requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" } })
        -- Lua Line
        use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
        use("arkav/lualine-lsp-progress")
        -- Telescope
        use({ 'nvim-telescope/telescope.nvim', requires = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter" } })
        -- Dashboard
        use("glepnir/dashboard-nvim")
        -- Project
        use("ahmedkhalf/project.nvim")
        -- TreeSitter
        use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
        -- LSP
        use({ "neovim/nvim-lspconfig", "williamboman/nvim-lsp-installer" })
        -- NVim Cmp
        use("hrsh7th/nvim-cmp")
        use("hrsh7th/cmp-vsnip")
        use("hrsh7th/cmp-nvim-lsp")
        use("hrsh7th/cmp-buffer")
        use("hrsh7th/cmp-path")
        use("hrsh7th/cmp-cmdline")
        -- Snippet
        use("hrsh7th/vim-vsnip")
        -- Indent Blankline
        use("lukas-reineke/indent-blankline.nvim")
        -- Auto pair
        use("windwp/nvim-autopairs")
        -- Rainbow
        use("p00f/nvim-ts-rainbow")
        -- LSPKind
        use("onsails/lspkind-nvim")
        -- LSP Saga
        use("tami5/lspsaga.nvim")
        -- null-ls
        use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
        -- Dap
        use("mfussenegger/nvim-dap")
        use("Pocco81/dap-buddy.nvim")
        use("theHamsta/nvim-dap-virtual-text")
        use("rcarriga/nvim-dap-ui")
        -- ToggleTerm
        use("akinsho/toggleterm.nvim")
        -- TODO
        use({ "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" })
        -- AutoSave
        use "pocco81/auto-save.nvim"
        -- RustTool
        use("simrat39/rust-tools.nvim")
    end,
    config = {
        -- Packer安装界面悬浮
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    }
})

-- 当此文件保存时，自动调用:PackerSync
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)


-- Plugin Config
require("plugin-config.bufferline")
require("plugin-config.nvim-tree")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.project")
require("plugin-config.dashboard")
require("plugin-config.treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.autopairs")
require("plugin-config.dap")
require("plugin-config.toggleterm")
require("plugin-config.todo")
require("plugin-config.autosave")
