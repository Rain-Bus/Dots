---@class NVimConfig
local defaults = {
  switchs = {
    plugins = true,
    options = true,
    keymaps = true,
    autocmds = true,
  },
}

---@type NVimConfig
local options
---@type NVimConfig
local M = {}
local N = {}

function M.setup(opts)
  N.has_lazy()
  N.merge_opts(opts)
  N.load()
end

function N.has_lazy()
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazy_path,
    })
  end
  vim.opt.rtp:prepend(lazy_path)
end

function N.merge_opts(opts)
  options = vim.tbl_deep_extend("force", defaults, opts or {})
end

function N.load()
  local require_s = require("utils.notify").safe_require
  if options.switchs.plugins == true then
    -- TODO: replace
    require_s("config.plugins")
  else
    require_s("lazy").setup()
  end
  for k, v in pairs(options.switchs) do
    if k == "plugins" or not v then
      goto continue
    end
    local module_name = "config." .. k
    require_s(module_name)
    ::continue::
  end
end

return M
