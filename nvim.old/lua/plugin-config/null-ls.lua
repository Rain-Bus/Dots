local status, null_ls = pcall(require, "null-ls")
if not status then
    vim.notify("Not found null-ls")
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

null_ls.setup({
    debug = false,
    sources = {
        -- Formatting ---------------------
        --  brew install shfmt
        -- formatting.shfmt,
        -- StyLua
        formatting.stylua,
        -- frontend
        formatting.prettier.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "vue",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "yaml",
                "graphql",
            },
            prefer_local = "node_modules/.bin",
        }),
        -- Rustfmt
        formatting.rustfmt,
        -- Gofmt
        formatting.gofmt,
        -- formatting.fixjson,
        -- Python
        formatting.black.with({ extra_args = { "--fast" } }),
        code_actions.gitsigns,
        code_actions.eslint.with({
            prefer_local = "node_modules/.bin",
        }),
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
        end
    end,
})
