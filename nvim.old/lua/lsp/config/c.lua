local lsp_util = require("lspconfig.util")

local opts = {
    cmd                 = { "clangd" },
    filetypes           = { "c", "cpp", "objc", "objcpp" },
    root_dir            = lsp_util.root_pattern(
        '.clangd',
        '.clang-tidy',
        '.clang-format',
        'compile_commands.json',
        'compile_flags.txt',
        'configure.ac',
        '.git'
    ),
    single_file_support = true,
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        require("keybindings").mapLSP(buf_set_keymap)
    end
}
return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
