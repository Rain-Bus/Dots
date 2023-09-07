local nuls = require("null-ls")

local sources = {
  nuls.builtins.formatting.stylua,
  nuls.builtins.formatting.rustfmt,
  nuls.builtins.formatting.gofumpt,
  nuls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
  nuls.builtins.formatting.prettier,
  nuls.builtins.formatting.taplo,
  nuls.builtins.formatting.xmlformat,
  nuls.builtins.formatting.clang_format,
}

local special_name = {
  xmlformat = "xmlformatter",
}

local M = {}

function M.names()
  local res = {}
  for _, v in ipairs(sources) do
    table.insert(res, special_name[v.name] or v.name)
  end
  return res
end

function M.setup()
  nuls.setup({
    sources = sources,
  })
end

return M
