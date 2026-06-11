local M = {}

local formatters = {
  { name = "stylua", mason = "stylua" },
  { name = "rustfmt", mason = "system" },
  { name = "gofmt", mason = "system" },
  { name = "ruff_format", mason = "ruff" },
  { name = "ruff_organize_imports", mason = "ruff" },
  { name = "prettier", mason = "prettier" },
  { name = "clang-format", mason = "clang-format" },
  { name = "taplo", mason = "taplo" },
  { name = "xmlformatter", mason = "xmlformatter" },
  { name = "cmake_format", mason = "cmakelang" },
  { name = "verible", mason = "verible" },
}

local prettier_filetypes = {
  "javascript",
  "typescript",
  "tsx",
  "vue",
  "html",
  "css",
  "json",
  "yaml",
  "markdown",
}

function M.names()
  local seen = {}
  local res = {}
  for _, f in ipairs(formatters) do
    if f.mason ~= "system" and not seen[f.mason] then
      seen[f.mason] = true
      table.insert(res, f.mason)
    end
  end
  return res
end

function M.setup()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      python = { "ruff_format", "ruff_organize_imports" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      toml = { "taplo" },
      xml = { "xmlformatter" },
      cmake = { "cmake_format" },
      systemverilog = { "verible" },
      verilog = { "verible" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  })
  -- prettier covers many filetypes, add dynamically
  for _, ft in ipairs(prettier_filetypes) do
    require("conform").formatters_by_ft[ft] = { "prettier" }
  end
end

return M
