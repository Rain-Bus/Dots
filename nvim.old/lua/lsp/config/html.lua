local opts = {
    cmd = { "vscode-html-language-server", "--stdio" },
    filetypes = { "html" },
    init_options = {
        configurationSection = { "html", "css", "javascript" },
        embeddedLanguages = {
            css = true,
            javascript = true
        },
        provideFormatter = true
    },
    settings = {},
    single_file_support = true
}
return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
