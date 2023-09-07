local M = {}

---safe require with pcall
---@param mod string
function M.safe_require(mod)
  local status, result = pcall(require, mod)
  if not status then
    error(result)
  end
  return result
end

return M
