-- author: glepnr https://github.com/glepnir
-- date: 2022-07-02
-- License: MIT
-- recommend some vim mode key defines in this file

local keymap = require('core.keymap')
local nmap, imap, cmap, xmap, tmap = keymap.nmap, keymap.imap, keymap.cmap, keymap.xmap, keymap.tmap
local silent, noremap, expr, remap = keymap.silent, keymap.noremap, keymap.expr, keymap.remap
local opts = keymap.new_opts
local cmd = keymap.cmd

-- Use space as leader key
vim.g.mapleader = ' '

-- leaderkey
nmap({ ' ', '', opts(noremap) })
xmap({ ' ', '', opts(noremap) })

-- usage example
nmap({
    -- noremal remap
    -- close buffer
    { '[]c', cmd('bdelete'), opts(noremap, silent) },
    { '[c', cmd('BufferLineCloseLeft'), opts(noremap, silent) },
    { ']c', cmd('BufferLineCloseRight'), opts(noremap, silent) },
    -- pick
    { '[]p', cmd('BufferLinePick'), opts(noremap, silent) },
    { '[]pc', cmd('BufferLinePickClose'), opts(noremap, silent) },
    -- save
    { '[]w', cmd('write'), opts(noremap) },
    -- buffer jump
    { ']b', cmd('BufferLineCycleNext'), opts(noremap) },
    { '[b', cmd('BufferLineCyclePrev'), opts(noremap) },
    { ']B', cmd('BufferLineMoveNext'), opts(noremap) },
    { '[B', cmd('BufferLineMovePrev'), opts(noremap) },
    -- window jump
    { '<Leader>wh', '<C-w>h', opts(noremap) },
    { '<Leader>wl', '<C-w>l', opts(noremap) },
    { '<Leader>wj', '<C-w>j', opts(noremap) },
    { '<Leader>wk', '<C-w>k', opts(noremap) },
    -- packer
    { '<Leader>pu', cmd('PackerUpdate'), opts(noremap, silent) },
    { '<Leader>pi', cmd('PackerInstall'), opts(noremap, silent) },
    { '<Leader>pc', cmd('PackerCompile'), opts(noremap, silent) },
    -- dashboard
    { '<Leader>n', cmd('DashboardNewFile'), opts(noremap, silent) },
    { '<Leader>ss', cmd('SessionSave'), opts(noremap, silent) },
    { '<Leader>sl', cmd('SessionLoad'), opts(noremap, silent) },
    -- nvimtree
    { '<Leader>e', cmd('NvimTreeToggle'), opts(noremap, silent) },
    -- Telescope
    { '<Leader>fb', cmd('Telescope buffers'), opts(noremap, silent) },
    { '<Leader>fg', cmd('Telescope live_grep'), opts(noremap, silent) },
    { '<Leader>ff', cmd('Telescope find_files'), opts(noremap, silent) },
    { '<Leader>fh', cmd('Telescope help_tags'), opts(noremap, silent) },
    { '<Leader>fp', cmd('Telescope projects'), opts(noremap, silent) },
    { '<Leader>fd', cmd('Telescope dap list_breakpoints'), opts(noremap, silent) },
    { '<Leader>fv', cmd('Telescope dap variables'), opts(noremap, silent) },
    -- ToggleTerm
    { '<Leader>tt', cmd('ToggleTerm'), opts(noremap, silent) },
    -- Dap
    { '<Leader>du', cmd('lua require("dapui").toggle()'), opts(noremap, silent) },
    -- Trouble
    { '<Leader>xx', cmd('TroubleToggle'), opts(noremap, silent) },
    { '<Leader>xw', cmd('TroubleToggle workspace_diagnostics'), opts(noremap, silent) },
    { '<Leader>xd', cmd('TroubleToggle document_diagnostics'), opts(noremap, silent) },
    { '<Leader>xf', cmd('TroubleToggle quickfix'), opts(noremap, silent) },
    -- JetBrain's debug hotkey
    { '<F21>', cmd('DapContinue'), opts(noremap, silent) },
    { '<F7>', cmd('DapStepInto'), opts(noremap, silent) },
    { '<F8>', cmd('DapStepOver'), opts(noremap, silent) },
    { '<F9>', cmd('DapContinue'), opts(noremap, silent) },
    { '<F20>', cmd('DapStepOut'), opts(noremap, silent) },
    { '<F26>', cmd('DapTerminate'), opts(noremap, silent) },
    { '<F32>', cmd('DapToggleBreakpoint'), opts(noremap, silent) },
    { '<F57>', cmd('lua require("dap").run_to_cursor()'), opts(noremap, silent) },
    -- OSC52
    { '<Leader>y', require("osc52").copy_operator, opts(expr) },
    { '<Leader>yy', '<leader>y_', opts(remap) },
})

imap({
    -- insert mode
    { '<C-h>', '<Bs>', opts(noremap) },
    { '<C-e>', '<End>', opts(noremap) },
})

-- commandline remap
cmap({ '<C-b>', '<Left>', opts(noremap) })

-- terminal mode
tmap({ '<Leader>tt', cmd('ToggleTerm'), opts(noremap, silent) })

xmap(
    { '<leader>y', require("osc52").copy_visual }
)

local inner_plugin_map = {
    lsp = function(buffer)
        local bufopts = opts(noremap, silent, { buffer = buffer })
        nmap({
            { 'gd', cmd('Lspsaga peek_definition'), bufopts },
            { 'gD', cmd('Lspsaga goto_definition'), bufopts },
            { 'gr', cmd('Lspsaga rename'), bufopts },
            { 'gh', cmd('Lspsaga hover_doc'), bufopts },
            { 'gf', cmd('Lspsaga lsp_finder'), bufopts },
            { 'gR', cmd('TroubleToggle lsp_references'), bufopts },
            { 'gi', cmd('TroubleToggle lsp_implementations'), bufopts },
            { '<leader>lo', cmd('Lspsaga outline'), bufopts },
            { '<leader>lf', cmd('lua vim.lsp.buf.format({ async = true })'), bufopts },
            { '<leader>lc', cmd('Lspsaga code_action'), bufopts },
            { '<leader>ll', cmd('Lspsaga show_line_diagnostics'), bufopts },
            { '<leader>ls', cmd('Lspsaga show_cursor_diagnostics'), bufopts },
            { '[e', cmd('Lspsaga diagnostic_jump_prev'), bufopts },
            { ']e', cmd('Lspsaga diagnostic_jump_next'), bufopts },
        })
    end,

    rust_tools = function(buffer)
        local bufopts = opts(noremap, silent, { buffer = buffer })
        vim.b.rust_tools_debug = true
        nmap({
            { '<F21>', cmd('RustDebuggables'), bufopts },
            { '<F22>', cmd('RustRunnables'), bufopts },
            { '<Leader>rc', cmd('lua require("keymap.config").change_dap(' .. buffer .. ')'), bufopts },
            { '<Leader>rp', cmd('RustParentModule'), bufopts },
            { '<Leader>ro', cmd('RustOpenCargo'), bufopts },
            { '<Leader>ru', cmd('RustMoveItemUp'), bufopts },
            { '<Leader>rd', cmd('RustMoveItemDown'), bufopts },
        })
    end,

    dapui = {
        expand = { 'o', '<2-LeftMouse>', '<CR>' },
        open = 'O',
    },
}

function inner_plugin_map.change_dap(buffer)
    local bufopts = opts(noremap, { buffer = buffer })
    if vim.b.rust_tools_debug then
        vim.keymap.del('n', '<F21>', { buffer = buffer })
        nmap({ '<F21>', cmd('DapContinue'), bufopts })
        vim.b.rust_tools_debug = not vim.b.rust_tools_debug
    else
        vim.keymap.del('n', '<F21>', { buffer = buffer })
        nmap({ '<F21>', cmd('RustDebuggables'), bufopts })
        vim.b.rust_tools_debug = not vim.b.rust_tools_debug
    end
end

return inner_plugin_map
