local ok_status, autosave = pcall(require, 'auto-save')
if not ok_status then
    vim.notify('Not find autosave')
    return
end

autosave.setup({
    enabled = true,
    events = { "InsertLeave", "TextChanged" },
    conditions = {
        exists = true,
        filename_is_not = {},
        filetype_is_not = {},
        modifiable = true
    },
    write_all_buffers = false,
    on_off_commands = true,
    clean_command_line_interval = 0,
    debounce_delay = 135
})
