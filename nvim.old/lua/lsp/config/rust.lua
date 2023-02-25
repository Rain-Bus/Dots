local lsp_util = require("lspconfig.util")

local opts = {
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_dir = lsp_util.root_pattern("Cargo.toml", "rust-project.json"),
    settings = {
        ["rust-analyzer"] = {}
    },
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end

        require("keybindings").mapLSP(buf_set_keymap)
    end,
}
return {
    on_setup = function(server)
        require("rust-tools").setup({
            server = vim.tbl_deep_extend("force", server:get_default_options(), opts),
        })
        server:attach_buffers()
        --require("rust-tools").start_standalone_if_required()
    end,
}
