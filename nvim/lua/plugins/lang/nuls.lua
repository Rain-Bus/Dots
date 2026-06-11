local nuls = require("null-ls")

local sources = {
  nuls.builtins.formatting.stylua,
  nuls.builtins.formatting.rustfmt,
  nuls.builtins.formatting.gofumpt,
  nuls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
  nuls.builtins.formatting.prettier,
  nuls.builtins.formatting.tidy,
  nuls.builtins.formatting.taplo,
  nuls.builtins.formatting.clang_format,
  nuls.builtins.formatting.verible_verilog_format,
}

local mason_names = {
  stylua = "stylua",
  gofumpt = "gofumpt",
  black = "black",
  prettier = "prettier",
  taplo = "taplo",
  clang_format = "clang-format",
}

local M = {}

function M.names()
  local res = {}
  for _, v in ipairs(sources) do
    if v and mason_names[v.name] then
      table.insert(res, mason_names[v.name])
    end
  end
  return res
end

function M.setup()
  nuls.setup({
    sources = sources,
  })
end

return M
