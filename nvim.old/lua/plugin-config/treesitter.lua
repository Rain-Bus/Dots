local ok_status, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok_status then
    vim.notify("Not find ntreesitter")
    return
end

treesitter.setup({
    ensure_installed = { "json", "markdown", "html", "css", "vim", "lua", "javascript", "typescript", "tsx", "java", "go",
        "python" },
    -- 高亮
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- 选择
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<CR>",
            node_incremental = "<CR>",
            node_decremental = "<BS>",
            scope_incremental = "<TAB>",
        },
    },
    -- 缩进
    indent = {
        enable = true,
    },
    -- 括号颜色
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil,
    }
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
