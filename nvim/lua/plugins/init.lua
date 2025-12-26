local arrays = require("utils.arrays")

---@class PluginConfig
local N = {
  ---@type LazyConfig[]
  configs = {},
  ---@type string[]
  exclude = { "goolord/alpha-nvim" },
}

local M = {}

---register plugin config
---@param conf LazyConfig
function M.register(conf)
  if not arrays.contains(N.exclude, conf[1]) then
    table.insert(N.configs, conf)
  end
end

function M.get_all()
  return N.configs
end

return M
