local M = {}

function M.map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  if opts.remap then
    opts.remap = nil
  end
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
