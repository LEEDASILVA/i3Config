local opt = vim.opt

opt.scrolloff = 10

-- Enable line numbers
opt.number = true
opt.relativenumber = true

-- Set tab width and spaces
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark" -- color schemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swap file
opt.swapfile = false

-- space will be a
opt.list = true
opt.listchars:append("space:·")

-- add spelling
opt.spelllang = "en_us"
opt.spell = true

opt.colorcolumn = "79"
