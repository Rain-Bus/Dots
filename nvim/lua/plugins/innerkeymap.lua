local M = {}

local map = require("utils.keymaps").map

M.lsp = function(bufnr)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", { desc = "Go to definition", buf = bufnr })
  map("n", "gr", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename", buf = bufnr })
  map("n", "gh", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Popup document", buf = bufnr })
  map("n", "gR", "<cmd>Trouble lsp_references toggle<cr>", { desc = "Show references", buf = bufnr })
  map("n", "gi", "<cmd>Trouble lsp_implementations toggle<cr>", { desc = "Show implementations", buf = bufnr })
  map("n", "[e", "<cmd>lua vim.diagnostic.jump({ count = -1 })<cr>", { desc = "Goto last diagnostic", buf = bufnr })
  map("n", "]e", "<cmd>lua vim.diagnostic.jump({ count = 1 })<cr>", { desc = "Goto next diagnostic", buf = bufnr })
  map("n", "<LEADER>lo", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Show outline", buf = bufnr })
  map("n", "<LEADER>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code action", buf = bufnr })
  map("n", "<LEADER>ll", "<cmd>lua vim.diagnostic.open_float()<cr>", { desc = "Show line diagnostic", buf = bufnr })
  map(
    "n",
    "<LEADER>lf",
    "<cmd>lua vim.lsp.buf.format({ async = true })<cr>",
    { desc = "Format buffer", buf = bufnr }
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
