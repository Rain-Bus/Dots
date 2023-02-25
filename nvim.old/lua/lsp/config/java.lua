local lsp_util = require("lspconfig.util")
local opts = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Xms1g", "-Xmx2G",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", "/home/fallen-angle/.local/share/nvim/lsp_servers/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
        "-configuration", "/home/fallen-angle/.local/share/nvim/lsp_servers/jdtls/config_linux",
        "-data", "/home/fallen-angle/.local/share/nvim/jdtls_workspace",
    },
    filetypes = { "java" },
    init_options = {
        jvm_args = {},
        bundles = {}
    },
    settings = {
        java = {
        }
    },
    root_dir = lsp_util.root_pattern(".git","mvnw","mvnw.cmd","pom.xml","gradlew")
}
return {
    on_setup = function(server)
        server:setup(opts)
    end,
}
