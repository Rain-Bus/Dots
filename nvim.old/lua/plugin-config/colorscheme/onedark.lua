local status_ok, onedark = pcall(require, 'onedark')
if not status_ok then
    vim.notify("Not found onedark")
    return
end

onedark.setup {
    style = 'darker',
    transparent = vim.g.current_transparent,
    toggle_style_key = '<leader>c',
    toggle_style_list = {'darker', 'dark', 'cool', 'deep', 'warm', 'warmer', 'light'},
    code_style = {
        comments = 'none',
        keywords = 'none',
        functions = 'none',
        strings = 'none',
        variables = 'none'
    },
    -- Custom Highlights --
    colors = {}, -- Override default colors
    highlights = {}, -- Override highlight groups

    -- Plugins Config --
    diagnostics = {
        darker = true, -- darker colors for diagnostic
        undercurl = true,   -- use undercurl instead of underline for diagnostics
        background = true,    -- use background color for virtual text
    },
}

onedark.load()
