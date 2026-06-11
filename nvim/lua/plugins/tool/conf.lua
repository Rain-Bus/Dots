local M = {}

function M.telescope()
  require("telescope").load_extension("fzf")
  require("telescope").load_extension("ui-select")
  require("telescope").load_extension("undo")
  require("telescope").load_extension("lazy")
  require("telescope").load_extension("egrepify")
  return {
    pickers = {
      fd = {
        theme = "dropdown",
      },
    },
    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },
      ["ui-select"] = {
        require("telescope.themes").get_dropdown({}),
      },
    },
  }
end

function M.toggleterm()
  return {
    direction = "float",
    float_opts = {
      border = "curved",
    },
  }
end

function M.whichkey()
  return {}
end

return M
