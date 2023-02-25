local lsp_util = require("lspconfig.util")
local opts = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gotmpl" },
    root_dir = lsp_util.root_pattern("go.mod", ".git"),
    single_file_support = true,
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        --client.resolved_capabilities.document_formatting = false
        --client.resolved_capabilities.document_range_formatting = false

        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require('keybindings').mapLSP(buf_set_keymap)
        -- 保存时自动格式化
        vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()')
    end,
}
return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
