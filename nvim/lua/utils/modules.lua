local M = {}

---find the module
---@param mod string
function M.is_exist(mod)
  local status, _ = pcall(require, mod)
  return status
end

return M
