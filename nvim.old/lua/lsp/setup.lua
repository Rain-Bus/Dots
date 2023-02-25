local lsp_installer = require("nvim-lsp-installer")

local servers = {
    sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
    jdtls = require("lsp.config.java"),
    tsserver = require("lsp.config.ts"),
    gopls = require("lsp.config.go"),
    jsonls = require("lsp.config.json"),
    jedi_language_server = require("lsp.config.python"),
    volar = require("lsp.config.vue"),
    yamlls = require("lsp.config.yaml"),
    html = require("lsp.config.html"),
    rust_analyzer = require("lsp.config.rust"),
    clangd = require("lsp.config.c")
}
for name, _ in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found then
        if not server:is_installed() then
            print("Installing " .. name)
            server:install()
        end
    end
end

lsp_installer.on_server_ready(function(server)
    local config = servers[server.name]
    if config == nil then
        return
    end
    if config.on_setup then
        config.on_setup(server)
    else
        server:setup({})
    end
end)
