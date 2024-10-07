local M = {}

local map = require("utils.keymaps").map

M.cmp = function()
    local cmp = require("cmp")
    return {
        ["<C-k>"] = cmp.mapping.scroll_docs(-4),
        ["<C-j>"] = cmp.mapping.scroll_docs(4),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }
end

M.lsp = function(bufnr)
    map("n", "gd", "<cmd>Lspsaga peek_definition<cr>", { desc = "Popup definition", buffer = bufnr })
    map("n", "gD", "<cmd>Lspsaga goto_definition<cr>", { desc = "Go to definition", buffer = bufnr })
    map("n", "gr", "<cmd>Lspsaga rename<cr>", { desc = "Rename", buffer = bufnr })
    map("n", "gh", "<cmd>Lspsaga hover_doc<cr>", { desc = "Popup document", buffer = bufnr })
    map("n", "gf", "<cmd>Lspsaga lsp_finder<cr>", { desc = "Find ref and def", buffer = bufnr })
    map("n", "gR", "<cmd>Trouble lsp_references<cr>", { desc = "Show references", buffer = bufnr })
    map("n", "gi", "<cmd>Trouble lsp_implementations<cr>", { desc = "Show implementations", buffer = bufnr })
    map("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<cr>", { desc = "Goto last diagnostic", buffer = bufnr })
    map("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<cr>", { desc = "Goto next diagnostic", buffer = bufnr })
    map("n", "<LEADER>lo", "<cmd>Lspsaga outline<cr>", { desc = "Show implementations", buffer = bufnr })
    map("n", "<LEADER>la", "<cmd>Lspsaga code_action<cr>", { desc = "Show implementations", buffer = bufnr })
    map("n", "<LEADER>ll", "<cmd>Lspsaga show_line_diagnostics<cr>", { desc = "Show line diagnostic", buffer = bufnr })
    map(
        "n",
        "<LEADER>lc",
        "<cmd>Lspsaga show_cursor_diagnostics<cr>",
        { desc = "Show cursor diagnostic", buffer = bufnr }
    )
    map(
        "n",
        "<LEADER>lf",
        "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
        { desc = "Show cursor diagnostic", buffer = bufnr }
    )
end

M.dapui = function()
    return {
        expand = { "o", "<2-LeftMouse>", "<CR>" },
        open = "O",
    }
end

M.signature = {
    toggle_float = function()
        require("lsp_signature").toggle_float_win()
    end,
}

M.dap = {
    run_to_cursor = function()
        require("dap").run_to_cursor()
    end,
}

return M
