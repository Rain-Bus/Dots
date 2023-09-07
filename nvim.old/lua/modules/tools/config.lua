local config = {}

function config.telescope()
    require('telescope').setup({
        pickers = {
            find_files = {
                theme = 'dropdown',
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = 'smart_case',
            },
            project = {
                base_dirs = {
                    { '~/Projects/', max_depth = 3 },
                },
                hidden_files = true,
                theme = 'dropdown',
                sync_with_nvim_tree = true,
                search_by = 'title',
            },
            ["ui-select"] = {
                require("telescope.themes").get_dropdown {}
            },
        },
    })
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('projects')
    require('telescope').load_extension('dap')
    require("telescope").load_extension("ui-select")
end

function config.toggleterm()
    require('toggleterm').setup({
        direction = 'float',
    })
end

function config.project()
    require('project_nvim').setup({})
end

function config.whichkey()
    vim.o.timeoutlen = 300
    require("which-key").setup({})
end

function config.osc52()
    require('osc52').setup({
        silent = true,
    })
end

return config
