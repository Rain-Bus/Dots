local opt = vim.opt

-- TEXT PROCESS
-- Tab Width
local tab_size = 4
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
opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"

-- Short Message
opt.shortmess = "aoOTIcCF"

-- Wrap
opt.linebreak = true
opt.whichwrap = "h,l,<,>,[,],~"
opt.breakindentopt = "shift:2,min:20"
opt.showbreak = "↳  "

-- Number
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"

-- Scroll Off
opt.scrolloff = 8
opt.sidescrolloff = 8

-- Cursor
opt.virtualedit = "block"

-- Buffer
opt.hidden = true

-- Mouse
opt.mouse = ""

-- File Safe
local cache_dir = os.getenv("HOME") .. "/.cache/nvim/"
opt.directory = cache_dir .. "swap/"
opt.undodir = cache_dir .. "undo/"
opt.backupdir = cache_dir .. "backup/"
opt.viewdir = cache_dir .. "view/"
opt.spellfile = cache_dir .. "spell/en.uft-8.add"
opt.updatetime = 1000
opt.undofile = true
opt.autoread = true
opt.autowrite = true
opt.confirm = true

-- Timeout
opt.timeout = true
opt.timeoutlen = 400
opt.ttimeout = true
opt.ttimeoutlen = 10

-- Search
opt.magic = true
opt.hlsearch = false
opt.redrawtime = 1500
opt.ignorecase = true
opt.smartcase = true
opt.infercase = true
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- Complete Option
opt.completeopt = "menu,menuone,noselect,noinsert"
opt.wildignorecase = true

-- Spell Check
opt.spelloptions = "camel"

-- Commad History
opt.history = 2000

-- Apperance
opt.termguicolors = true

-- Clipboard
opt.clipboard = "unnamedplus"

function no_paste(reg)
  return function(lines)
    -- Do nothing! We can't paste with OSC52
  end
end

vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    -- ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    -- ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
    ["+"] = no_paste("+"), -- Pasting disabled
    ["*"] = no_paste("*"), -- Pasting disabled
  },
}

-- LAYOUT
-- Bottom
opt.showmode = false
opt.cmdheight = 2

-- Top
opt.showtabline = 2
opt.list = true
opt.listchars = "tab:  ,nbsp:+,trail:·,extends:→,precedes:←"

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
-- NvimTree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
