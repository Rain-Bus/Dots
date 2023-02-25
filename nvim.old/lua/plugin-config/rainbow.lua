local ok_status, treesitter = pcall(require, "nvim-treesitter.configs")
if ok_status then
    vim.notify("Not find treesitter")
    return
end

treesitter.setup({
    
})
