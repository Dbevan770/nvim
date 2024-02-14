-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Global Status Line
vim.opt.laststatus = 3
vim.opt.showmode = false

vim.opt.clipboard = "unnamedplus"
vim.opt.cursorline = true

-- Line Numbers
vim.opt.number = true
vim.opt.numberwidth = 2
vim.opt.ruler = false

-- Tab Width
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Smart Indent
vim.opt.smartindent = true

vim.opt.fillchars = { eob = " " }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = "a"

-- Disable Nvim Intro
vim.opt.shortmess:append("sI")

-- Text Wrapping
vim.opt.wrap = true
vim.o.breakindent = true

-- File System
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- True Color
vim.opt.termguicolors = true

-- Scroll
vim.opt.signcolumn = "yes"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.scrolloff = 8
vim.opt.isfname:append("@-@")

-- Update Time
vim.opt.updatetime = 50
vim.o.timeoutlen = 300

-- Right side column position
vim.opt.colorcolumn = "100"
vim.opt.textwidth = 100

vim.opt.whichwrap:append("<>[]hl")

-- Map Leader
vim.g.mapleader = " "
