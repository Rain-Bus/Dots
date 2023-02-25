local config = {}

function config.treesitter()
    require('nvim-treesitter.configs').setup({
        ensure_installed = {
            'c',
            'css',
            'lua',
            'rust',
            'go',
            'java',
            'javascript',
            'typescript',
            'html',
            'json',
            'markdown',
            'python',
            'vue',
            'yaml',
            'toml',
            'tsx',
            'toml',
        },
        sync_install = false,
        auto_install = true,
        highlight = {
            enable = true,
        },
    })
end

function config.mason()
    require('mason').setup({})
end

function config.masonlsp()
    require('mason-lspconfig').setup({
        ensure_installed = {
            'clangd',
            'cssls',
            'gopls',
            'html',
            'jsonls',
            'jdtls',
            'tsserver',
            'lua_ls',
            'marksman',
            'pyright',
            'rust_analyzer',
            'taplo',
            'volar',
            'lemminx',
            'yamlls',
        },
    })
end

function config.cmp()
    local cmp = require('cmp')
    local keymap = {
        ['<C-k>'] = cmp.mapping.scroll_docs(-4),
        ['<C-j>'] = cmp.mapping.scroll_docs(4),
        ['<Up>'] = cmp.mapping.select_prev_item(),
        ['<Down>'] = cmp.mapping.select_next_item(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
    cmp.setup({
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' },
            { name = 'buffer' },
        }),
        mapping = keymap,
    })
    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' },
        },
    })
    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' },
            { name = 'cmdline' },
        }),
    })
end

function config.lsp()
    require('modules.lang.lsp')
end

function config.null_ls()
    local null_ls = require('null-ls')
    local formatting = null_ls.builtins.formatting
    null_ls.setup({
        sources = {
            formatting.rustfmt,
            formatting.gofmt,
            formatting.black.with({ extra_args = { '--fast' } }),
            formatting.stylua.with({ indent_width = 4 }),
            formatting.prettier,
            formatting.taplo,
            formatting.xmlformat,
            formatting.clang_format,
        },
        debug = true,
    })
end

function config.dap()
    require('modules.lang.dap')
end

function config.rust_tools()
    local rt = require('rust-tools')
    local keymap = require('keymap.config')
    local data_path = require("core.helper").get_data_path()
    local codelldb_path = data_path .. "/mason/bin/codelldb"
    local liblldb_path = data_path .. "/mason/packages/codelldb/extension/lldb/lib/liblldb.so"
    rt.setup({
        server = {
            on_attach = function(_, bufnr)
                keymap.lsp(bufnr)
                keymap.rust_tools(bufnr)
            end,
        },
        dap = {
            adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path),
        },
    })
end

return config
