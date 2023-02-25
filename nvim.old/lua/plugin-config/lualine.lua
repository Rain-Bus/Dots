local ok_status, lualine = pcall(require, "lualine")
if not ok_status then
    vim.notify("Not find lualine")
    return
end

lualine.setup({
    options = {
        theme = require("plugin-config.colorscheme.lualine-theme").theme(),
        component_separators = '|',
        section_separators = { left = '', right = '' },
        disabled_filetypes = { "toggleterm" }
    },
    extensions = { "nvim-tree", "toggleterm" },
    -- Six sectios' content
    sections = {
        lualine_a = {
            {
                'mode',
                separator = { left = '' },
                right_padding = 2
            },
        },
        lualine_c = {
            "filename",
            {
                "lsp_progress",
                spinner_symbols = { " ", " ", " ", " ", " ", " " },
            },
        },
        lualine_x = {
            "filesize",
            {
                "fileformat",
                -- symbols = {
                --   unix = '', -- e712
                --   dos = '', -- e70f
                --   mac = '', -- e711
                -- },
                symbols = {
                    unix = "LF",
                    dos = "CRLF",
                    mac = "CR",
                },
            },
            "encoding",
            "filetype",
        },
        lualine_z = {
            {
                'location',
                separator = { right = '' },
                left_padding = 2
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
})
