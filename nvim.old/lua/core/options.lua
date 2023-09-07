local opt = vim.opt
local cache_dir = require('core.helper').get_cache_path()

-- TEXT PROCESS
-- Tab Width
local tab_size = 2
opt.tabstop = tab_size
opt.softtabstop = tab_size
opt.smarttab = true
opt.expandtab = true

-- Shift Width
opt.shiftround = true
opt.shiftwidth = tab_size

-- Indent
opt.autoindent = true
opt.smartindent = true

-- EDITOR SETTING
-- Encoding
opt.encoding = 'UTF-8'
opt.fileencoding = 'UTF-8'

-- Short Message
opt.shortmess = 'aoOTIcF'

-- Wrap
opt.linebreak = true
opt.whichwrap = 'h,l,<,>,[,],~'
opt.breakindentopt = 'shift:2,min:20'
opt.showbreak = '↳  '

-- Number
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'

-- Scroll Off
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Cursor
opt.virtualedit = 'block'

-- Buffer
opt.hidden = true

-- Mouse
opt.mouse = ''

-- File Safe
opt.directory = cache_dir .. 'swap/'
opt.undodir = cache_dir .. 'undo/'
opt.backupdir = cache_dir .. 'backup/'
opt.viewdir = cache_dir .. 'view/'
opt.spellfile = cache_dir .. 'spell/en.uft-8.add'
opt.updatetime = 1000
opt.undofile = true
opt.autoread = true

-- Timeout
opt.timeout = true
opt.timeoutlen = 500
opt.ttimeout = true
opt.ttimeoutlen = 10

-- Search
opt.magic = true
opt.hlsearch = false
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true

-- Complete Option
opt.completeopt = 'menu,menuone,noselect,noinsert'
opt.wildignorecase = true

-- Spell Check
opt.spelloptions = 'camel'

-- Commad History
opt.history = 2000

-- Apperance
opt.termguicolors = true

-- Clipboard
opt.clipboard = 'unnamedplus'

-- LAYOUT
-- Bottom
opt.showmode = false
opt.cmdheight = 2

-- Top
opt.showtabline = 2
opt.list = true
opt.listchars = 'tab:  ,nbsp:+,trail:·,extends:→,precedes:←'

-- Windows
opt.winwidth = 30

-- Popup
opt.pumheight = 15
opt.pumblend = 10

-- Float
opt.winblend = 10

-- Split Windows
opt.splitbelow = true
opt.splitright = true

-- OTHER
-- Replace grep
if vim.fn.executable('rg') == 1 then
    opt.grepformat = '%f:%l:%c:%m,%f:%l:%m'
    opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
end

-- NVim Tree\
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
