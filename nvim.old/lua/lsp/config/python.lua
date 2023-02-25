local opts = {
    cmd = { "jedi-language-server" },
    filetype = { "python" },
    single_file_support = true
}

return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
