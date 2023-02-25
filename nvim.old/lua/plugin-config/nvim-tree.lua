local ok_status, nvim_tree = pcall(require, "nvim-tree")
if not ok_status then
    vim.notify("Not found nvim-tree")
    return
end

local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
    git = {
        enable = true,
    },
    -- project plugin
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
    -- hide .file and node_modules
    filters = {
        dotfiles = true,
        custom = { 'node_modules' },
    },
    view = {
        width = 40,
        side = 'left',
        hide_root_folder = false,
        -- hotkeys in file list
        mappings = {
            custom_only = false,
            list = list_keys,
        },
        number = false,
        relativenumber = false,
        -- show icons
        signcolumn = 'yes',
    },
    actions = {
        open_file = {
            -- resize while first open
            resize_window = true,
            -- close while open a file
            quit_on_open = true,
        },
    },
    system_open = {
        cmd = 'xdg-open',
    },
})
-- auto close
--vim.cmd([[
--  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
--]])

--icon
vim.g.nvim_tree_icons = {
    git = {
        untracked = '•',
    }
}
