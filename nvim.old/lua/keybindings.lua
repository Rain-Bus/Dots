vim.g.mapleader = " "
vim.g.maplocalleader = " "


local map = vim.api.nvim_set_keymap
--local bufmap = vim.api.nvim_buf_set_keymap
local opt = {noremap = true, silent = true}
--local mapopt = {noremap = false, silent = true}

-- split
map("n", "sv", ":vsp<CR>", opt)
map("n", "sh", ":sp<CR>", opt)
map("n", "sc", "<C-w>c", opt)   -- split close current
map("n", "so", "<C-w>o", opt)   -- split close others

-- split jump
map("n", "<A-h>", "<C-w>h", opt)
map("n", "<A-j>", "<C-w>j", opt)
map("n", "<A-k>", "<C-w>k", opt)
map("n", "<A-l>", "<C-w>l", opt)

-- split size control
-- vertical size
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
-- horizontal size
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize +2<CR>", opt)
map("n", "<C-Up>", ":resize -2<CR>", opt)
-- equal size
map("n", "s=", "<C-w>=", opt)

-- Terminal
map("n", "<leader>b", ":lua _BASHTOP_TOGGLE()<cr>", opt)
map("n", "<leader>g", ":lua _LAZYGIT_TOGGLE()<cr>", opt)
map("t", "<Esc>", [[ <C-\><C-N> ]], opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- Visual mode batch
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)   -- batch collspan
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt) -- batch move

-- Scroll
map("n", "<C-j>", "4j", opt)
map("n", "<C-k>", "4k", opt)
map("n", "<C-u>", "9k", opt)
map("n", "<C-d>", "9j", opt)
map("v", "p", '"_dP', opt)  -- not cpoy while paste

-- Normal commad
map("n", "q", ":q<CR>", opt)
map("n", "wq", ":wqa<CR>", opt)
map("n", "qq", ":q!<CR>", opt)
map("n", "Q", ":qa!<CR>", opt)

-- Insert HotKey
map("i", "<C-h>", "<ESC>I", opt)
map("i", "<C-l>", "<ESC>A", opt)

-- Buffer Line
map("n", "<C-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<C-l>", ":BufferLineCycleNext<CR>", opt)
map("n", "<C-w>", ":Bdelete!<CR>", opt)
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)


-- NvimTree
map("n", "<A-m>", ":NvimTreeToggle<CR>", opt)
map("i", "<A-m>", "<Esc>:NvimTreeToggle<CR>", opt)

-- Debug
map("n", "<leader>db", ":DapToggleBreakpoint<CR>", opt)
map("n", "<leader>dB", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", opt)
map("n", "<leader>dr", "lua require'dap'.repl.open()<cr>", opt)
map("n", "<leader>dl", "lua require'dap'.run_last()<cr>", opt)
map("n", "<F7>", ":DapStepInto<CR>", opt)
map("n", "<F8>", ":DapStepOver<CR>", opt)
map("n", "<F20>", ":DapStepOut<CR>", opt)
map("n", "<F21>", ":DapContinue<CR>", opt)
map("n", "<F26>", ":DapTerminate<CR>", opt)
map("n", "<F44>", "lua require'dap'.list_breakpoints()<cr>", opt)
map("n", "<F57>", "lua require'dap'.run_to_cursor()<cr>", opt)
map("n", "K", "<cmd>lua require'dapui'.eval()<cr>", opt)


-- Plugins' HotKey
local pluginKeys = {}
-- NvimTree
pluginKeys.nvimTreeList = {
    { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
    { key = "v", action = "vsplit" },
    { key = "h", action = "split" },
    { key = "i", action = "toggle_ignored" },     -- show ignored file(such as node_modles)
    { key = ".", action = "toggle_dotfiles" },    -- show hide file
    { key = "<F5>", action = "refresh" },
    { key = "a", action = "create" },
    { key = "d", action = "remove" },
    { key = "r", action = "rename" },
    { key = "x", action = "cut" },
    { key = "c", action = "copy" },
    { key = "p", action = "paste" },
    { key = "s", action = "system_open" },
}

-- Telescope
pluginKeys.telescopeList = {
    i = {
        -- Move updown
        ["<C-j>"] = "move_selection_next",
        ["<C-k>"] = "move_selection_previous",
        ["<Down>"] = "move_selection_next",
        ["<Up>"] = "move_selection_previous",
        -- History
        ["<C-n>"] = "cycle_history_next",
        ["<C-p>"] = "cycle_history_prev",
        -- Close window
        ["<C-w>"] = "close",
        -- Scroll preview window
        ["<C-u>"] = "preview_scrolling_up",
        ["<C-d>"] = "preview_scrolling_down",
    },
}

pluginKeys.mapLSP = function(mapbuf)
    -- rename
    -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
    -- code action
    -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
    -- go xx
    -- mapbuf('n', 'gd', '<cmd>Lspsaga preview_definition<CR>', opt)
    mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    -- mapbuf("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<CR>", opt)
    mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    -- mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
    -- diagnostic
    -- mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
    mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)
    -- mapbuf("n", "gk", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opt)
    mapbuf("n", "gk", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opt)
    -- mapbuf("n", "gj", "<cmd>lua vim.diagnostic.goto_next()<CR>", opt)
    mapbuf("n", "gj", "<cmd>Lspsaga diagnostic_jump_next<cr>", opt)
    mapbuf("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    -- 没用到
    -- mapbuf('n', '<leader>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opt)
    -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
    -- mapbuf('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opt)
    -- mapbuf('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opt)
    -- mapbuf('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opt)
end

pluginKeys.cmp = function(cmp)
    return {
        ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), {"i", "c"}),
        ["<A-,>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close()
        }),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<Up>"] = cmp.mapping.select_prev_item(),
        ["<Down>"] = cmp.mapping.select_next_item(),
        ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }),
        ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), {"i", "c"}),
        ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), {"i", "c"}),
    }
end

pluginKeys.dapui = {
    mappings = {
        -- Use a table to apply multiple mappings
        expand = { "o", "<2-LeftMouse>", "<CR>" },
        open = "O",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
        float = {
            close =  { "q", "<Esc>" },
        }
    },
}

pluginKeys.toggleterm = {
    terminalKey = [[ <leader>t ]],
}

return pluginKeys
