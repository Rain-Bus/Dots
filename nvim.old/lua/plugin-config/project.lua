local ok_status, project = pcall(require, "project_nvim")
if not ok_status then
    vim.notify("Not find project_nvim")
    return
end

-- To support NvimTree
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
    detection_methods = { "pattern" },
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})
