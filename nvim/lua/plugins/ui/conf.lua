local M = {}
function M.catppuccin()
  return {
    flavour = "mocha",
    background = {
      light = "latte",
      dark = "mocha",
    },
    transparent_background = true,
    term_colors = true,
  }
end

function M.nightfox()
  return {
    options = {
      transparent = true,
      styles = {
        comments = "italic",
        keywords = "bold",
        functions = "italic",
        types = "italic,bold",
      },
    },
  }
end

function M.nvim_tree()
  return {
    hijack_cursor = true,
    system_open = {
      cmd = "xdg-open",
    },
    renderer = {
      icons = {
        glyphs = {
          git = {
            untracked = "",
          },
        },
      },
    },
    -- projects
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
    },
  }
end

function M.bufferline()
  return {
    options = {
      show_buffer_close_icons = false,
      show_duplicate_prefix = true,
      separator_style = "thin",
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match("error") and "" or ""
        return "" .. icon .. count
      end,
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "left",
          separator = true,
          highlight = "Directory",
        },
      },
    },
  }
end

function M.lualine()
  require("plugins.ui.lualine")
end

function M.dashboard()
  return {}
end

function M.todo()
  return {}
end

function M.indent()
  local highlight = {
    "RainbowViolet",
    "RainbowCyan",
  }
  local hooks = require("ibl.hooks")
  hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  end)
  require("ibl").setup({
    indent = {
      highlight = highlight,
    },
  })
  return {
    indent = {
      highlight = highlight,
    },
  }
end

function M.dapui()
  return {
    icons = { expanded = "▾", collapsed = "▸" },
    mappings = require("plugins.innerkeymap").dapui(),
    layouts = {
      {
        elements = {
          { id = "scopes", size = 0.4 },
          { id = "stacks", size = 0.3 },
          { id = "watches", size = 0.3 },
        },
        size = 40,
        position = "left",
      },
      {
        elements = { "repl" },
        size = 0.3,
        position = "bottom",
      },
    },
  }
end

function M.lspsaga()
  return {}
end

function M.signature()
  return {
    bind = false,
    hint_enable = false,
  }
end

function M.trouble()
  return {}
end

return M
