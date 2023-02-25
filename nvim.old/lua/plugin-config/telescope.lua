local ok_status, telescope = pcall(require, "telescope")
if not ok_status then
    vim.notify("Not find telescope")
    return
end

telescope.setup({
    defaults = {
        initial_mode = "insert",
        mappings = require("keybindings").telescopeList,
    },
    pickers = {
        find_files = {
        }
    },
    extensions = {
    },
})

pcall(telescope.load_extension, "projects")
