local lsp_util = require("lspconfig.util")
local opts = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yaml.docker-compose" },
    root_dir = lsp_util.find_git_ancestor(),
    settings = {
        redhat = {
            telemetry = {
                enabled = false
            }
        }
    },
    single_file_support = true
}
return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
