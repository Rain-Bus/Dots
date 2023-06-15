local config = {}

function config.tokyonight()
    require('tokyonight').setup({
        style = 'night',
        transparent = true,
        terminal_colors = true,
    })
    vim.cmd('colorscheme tokyonight')
end

function config.onedark()
    require('onedark').setup({
        style = 'darker',
        transparent = true,
        terminal_colors = true,
    })
    require('onedark').load()
end

function config.catppuccin()
    require('catppuccin').setup({
        flavour = 'mocha',
        background = {
                       -- :h background
            light = 'latte',
            dark = 'mocha',
        },
        transparent_background = true,
        term_colors = true,
    })
    vim.cmd('colorscheme catppuccin')
end

function config.nightfox()
    require('nightfox').setup({
        options = {
            style = 'darker',
            transparent = true,
            terminal_colors = true,
            styles = {
                --comments = 'italic',
                keywords = 'bold',
                types = 'bold',
                --functions = 'italic',
            },
        },
    })
    vim.cmd('colorscheme nightfox')
end

function config.nvim_tree()
    require('nvim-tree').setup({
        disable_netrw = false,
        hijack_cursor = true,
        hijack_netrw = true,
        system_open = {
            cmd = 'xdg-open',
        },
        view = {
            hide_root_folder = false,
            mappings = {
                list = {
                    { key = 'h',    action = 'split' },
                    { key = 'v',    action = 'vsplit' },
                    { key = 'i',    action = 'toggle_ignored' },
                    { key = '.',    action = 'toggle_dotfiles' },
                    { key = '<F5>', action = 'refresh' },
                },
            },
        },
        renderer = {
            icons = {
                glyphs = {
                    git = {
                        unstaged = 'x',
                        staged = '✓',
                    },
                },
            },
        },
    })
    local function open_nvim_tree(data)
        local directory = vim.fn.isdirectory(data.file) == 1
        if not directory then
            return
        end
        vim.cmd.cd(data.file)
        require('nvim-tree.api').tree.open()
    end
    vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = open_nvim_tree })
end

function config.lualine()
    require('modules.ui.statusline')
end

function config.bufferline()
    require('bufferline').setup({
        options = {
            show_buffer_close_icons = false,
            show_duplicate_prefix = true,
            separator_style = 'thin',
            diagnostics = 'nvim_lsp',
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local icon = level:match('error') and '' or ''
                return '' .. icon .. count
            end,
            offsets = {
                {
                    filetype = 'NvimTree',
                    text = 'File Explorer',
                    text_align = 'left',
                    separator = true,
                    highlight = 'Directory',
                },
            },
        },
    })
end

function config.dashboard()
    require('dashboard').setup({
        config = {
            week_header = {
                enable = true,
            },
            shortcut = {
                { desc = ' Update', group = '@property', action = 'PackerSync', key = 'u' },
                {
                    desc = ' Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                },
                -- {
                --     desc = ' Apps',
                --     group = 'DiagnosticHint',
                --     action = 'Telescope app',
                --     key = 'a',
                -- },
                {
                    desc = ' projects',
                    group = 'Number',
                    action = 'Telescope projects',
                    key = 'p',
                },
            },
        },
        project = {
            enable = false,
        },
        footer = {},
    })
end

function config.lspsaga()
    require('lspsaga').setup({})
end

function config.lspkind()
    local cmp = require('cmp')
    cmp.setup({
        formatting = {
            format = require('lspkind').cmp_format({
                mode = 'symbol',
                maxwidth = 50,
                ellipsis_char = '...',
            }),
        },
    })
    local signs = { Error = ' ', Warn = ' ', Hint = ' ', Info = ' ' }
    for type, icon in pairs(signs) do
        local hl = 'DiagnosticSign' .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl })
    end
    vim.diagnostic.config({
        virtual_text = {
            prefix = '',
        },
    })
end

function config.signature()
    require('lsp_signature').setup({
        bind = false,
        hint_enable = false,
    })
end

function config.todo()
    require('todo-comments').setup({})
end

function config.indent()
    vim.cmd([[highlight IndentBlanklineIndent1 guifg=#3d607d gui=nocombine]])
    vim.cmd([[highlight IndentBlanklineIndent2 guifg=#8d929c gui=nocombine]])
    require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true,
        space_char_blankline = ' ',
        show_end_of_line = true,
        char_highlight_list = {
            'IndentBlanklineIndent1',
            'IndentBlanklineIndent2',
        },
    })
end

function config.dapui()
    local dap, dapui = require('dap'), require('dapui')
    dapui.setup({
        icons = { expanded = '▾', collapsed = '▸' },
        mappings = require('keymap.config').dapui,
        layouts = {
            {
                elements = {
                    { id = 'scopes',  size = 0.4 },
                    { id = 'stacks',  size = 0.3 },
                    { id = 'watches', size = 0.3 },
                },
                size = 40,
                position = 'left',
            },
            {
                elements = { 'repl' },
                size = 0.3,
                position = 'bottom',
            },
        },
    })
    dap.listeners.after.event_initialized['dapui_config'] = function()
        dapui.open({})
    end
    dap.listeners.before.event_terminated['dapui_config'] = function()
        dapui.close({})
    end
    dap.listeners.before.event_exited['dapui_config'] = function()
        dapui.close({})
    end
    dap.listeners.before.disconnect['dapui_config'] = function()
        dapui.close({})
    end
    -- Dap signs
    vim.fn.sign_define('DapBreakpoint', {
        text = 'ﱣ',
        texthl = 'LspDiagnosticsSignError',
        linehl = '',
        numhl = '',
    })
    vim.fn.sign_define('DapStopped', {
        text = '',
        texthl = 'LspDiagnosticsSignInformation',
        linehl = 'DiagnosticUnderlineInfo',
        numhl = 'LspDiagnosticsSignInformation',
    })
    vim.fn.sign_define('DapBreakpointRejected', {
        text = '',
        texthl = 'LspDiagnosticsSignHint',
        linehl = '',
        numhl = '',
    })
end

function config.trouble()
    require('trouble').setup({})
end

return config
