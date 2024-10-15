vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = require("utils.keymaps").map

-- Change mode
map({ "i", "t" }, "jk", "<ESC>", { desc = "Normal mode" })
map("n", "<ESC>w", "<cmd>wqa<cr>", { desc = "Save anad quit" })
map("n", "<ESC>q", "<cmd>qa!<cr>", { desc = "Force quit all" })

-- Better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- move windows
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Move Lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- buffers
map("n", "[b", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
map("n", "]b", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
map("n", "[B", "<cmd>BufferLineMovePrev<cr>", { desc = "Move buffer to prev" })
map("n", "]B", "<cmd>BufferLineMoveNext<cr>", { desc = "Move buffer to next" })
map("n", "[c", "<cmd>BufferLineCloseLeft<cr>", { desc = "Close left buffers" })
map("n", "]c", "<cmd>BufferLineCloseRight<cr>", { desc = "Close right buffers" })
map("n", "[]c", "<cmd>bdelete<cr>", { desc = "Close current buffer" })
map("n", "[]p", "<cmd>BufferLinePick<cr>", { desc = "Pick buffer" })
map("n", "[]pc", "<cmd>BufferLinePickClose<cr>", { desc = "Close Picked buffer" })

-- Telescope
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Telescope find buffers" })
map("n", "<leader>fd", "<cmd>Telescope fd<cr>", { desc = "Telescope find files" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Telescope grep text" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Telescope find help" })
map("n", "<leader>fp", "<cmd>Telescope project<cr>", { desc = "Telescope find project" })

-- ToggleTerm
map({ "n", "t" }, "<leader>tt", "<cmd>ToggleTerm<cr>", { desc = "ToggleTerm" })

-- NvimTree
map({ "n" }, "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" })

-- Dap
map("n", "<F7>", "<cmd>DapStepInto<cr>", { desc = "Debug step into" })
map("n", "<F8>", "<cmd>DapStepOver<cr>", { desc = "Debug step over" })
map("n", "<F9>", "<cmd>DapContinue<cr>", { desc = "Debug continue" })
map("n", "<F20>", "<cmd>DapStepOut<cr>", { desc = "Debug step out" })
map("n", "<F21>", "<cmd>DapContinue<cr>", { desc = "Debug continue" })
map("n", "<F26>", "<cmd>DapTerminate<cr>", { desc = "Debug terminate" })
map("n", "<F32>", "<cmd>DapToggleBreakpoint<cr>", { desc = "Toggle breakpoint" })
map("n", "<F44>", "<cmd>Telescope dap list_breakpoints<cr>", { desc = "List breakpoint" })
map("n", "<F57>", require("plugins.innerkeymap").dap.run_to_cursor, { desc = "Debug contunue" })

-- Trouble
map("n", "<leader>xx", "<cmd>Trouble toggle<cr>", { desc = "Toggle trouble" })
map("n", "<leader>xw", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Workspace diagnostic" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Document diagnostic" })
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Show quickfix" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>", { desc = "Show loclist" })
