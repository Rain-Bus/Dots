local M = {}

---find an array contains element
---@param arr any[]
---@param ele any
function M.contains(arr, ele)
  for _, element in ipairs(arr) do
    if ele == element then
      return true
    end
  end
  return false
end

return M
