vim.g.material_style = "palenight"
--vim.g.material_style = "lighter"

local status_ok, material = pcall(require, 'material')
if not status_ok then
    vim.notify("Not found material")
    return
end

material.setup({
	contrast = {
		sidebars = false, -- Enable contrast for sidebar-like windows ( for example Nvim-Tree )
		floating_windows = false, -- Enable contrast for floating windows
		line_numbers = false, -- Enable contrast background for line numbers
		sign_column = false, -- Enable contrast background for the sign column
		cursor_line = false, -- Enable darker background for the cursor line
		non_current_windows = false, -- Enable darker background for non-current windows
		popup_menu = false, -- Enable lighter background for the popup menu
	},
	italics = {
		comments = false, -- Enable italic comments
		keywords = false, -- Enable italic keywords
		functions = false, -- Enable italic functions
		strings = false, -- Enable italic strings
		variables = false -- Enable italic variables
	},
	contrast_filetypes = { -- Specify which filetypes get the contrasted (darker) background
		"terminal", -- Darker terminal background
		"packer", -- Darker packer background
		"qf" -- Darker qf list background
	},
	high_visibility = {
		lighter = false, -- Enable higher contrast text for lighter style
		darker = false -- Enable higher contrast text for darker style
	},
	disable = {
		borders = false, -- Disable borders between verticaly split windows
		background = vim.g.current_transparent, -- Prevent the theme from setting the background (NeoVim then uses your teminal background)
		term_colors = false, -- Prevent the theme from setting terminal colors
		eob_lines = false -- Hide the end-of-buffer lines
	},
	lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
	async_loading = true, -- Load parts of the theme asyncronously for faster startup (turned on by default)
	custom_highlights = {} -- Overwrite highlights with your own
})

vim.cmd 'colorscheme material'
local M = {}
M.toggle_transparent = function ()
    vim.g.current_transparent = not vim.g.current_transparent
    material.setup({
        disable = {
            background = vim.g.current_transparent
        }
    })
end


return M
