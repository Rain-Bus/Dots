local lsp_util = require("lspconfig.util")
local opts = {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetype = { "json", "jsonc" },
    init_options = { provideFormatter = true },
    root_dir = lsp_util.find_node_modules_ancestor,
    single_file_support = true
}

return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
