local ok_status, bufferline = pcall(require, 'bufferline')
if not ok_status then
    vim.notify('Not find bufferline')
    return
end

bufferline.setup({
    options = {
        -- Use moll/vim-bbye's ":Bdelete" to close tab
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        -- side column
        offsets = {
        {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "left",
            },
        },
        -- LSP
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)   -- LSP warn icons
            local s = " "
            for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " " or (e == "warning" and " " or "")
                s = s .. n .. sym
            end
            return s
        end,
    },
})
