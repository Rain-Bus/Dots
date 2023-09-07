local lazy = require("lazy")

local M = {}

M.exclude = {
  "nvim-neo-tree/neo-tree.nvim",
}

function M.theme()
  vim.cmd.colorscheme("nightfox")
end

function M.init()
  local plugin_conf_dir = vim.fn.stdpath("config") .. "/lua/plugins"
  local children = vim.fs.dir(plugin_conf_dir)
  for name, type in children do
    if type ~= "directory" then
      goto continue
    end
    local module_name = "plugins." .. name
    -- TODO: replace
    local status, _ = pcall(require, module_name)
    if not status then
      vim.notify("Not found: " .. module_name)
    end
    -- require("utils.notify").safe_require(module_name)
    ::continue::
  end
  local confs = require("plugins").get_all()
  lazy.setup(confs)
end

M.init()

M.theme()
