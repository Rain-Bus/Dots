local ok_status, blankline = pcall(require, 'indent_blankline')
if not ok_status then
    vim.notify('Not found indent_blankline')
end

vim.api.nvim_set_hl(0, 'IndentBlanklineIndent1', { fg = '#f7f1e3', nocombine = true })
vim.api.nvim_set_hl(1, 'IndentBlanklineIndent2', { fg = '#aaa69d', nocombine = true })

blankline.setup({
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
    },
    show_current_context = true,
    show_current_context_start = true,
    context_patterns = {
        "class",
        "function",
        "method",
        "element",
        "^if",
        "^while",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
    },
    filetype_exclude = {
        "dashboard",
        "packer",
        "terminal",
        "help",
        "log",
        "markdown",
        "TelescopePrompt",
        "lsp-installer",
        "lspinfo",
        "toggleterm",
    },
    char = "┆"
})
