local opt = vim.opt
local g = vim.g

-------------------------- Global Options --------------------------
-- Map Leader
g.mapleader = " "
g.maplocalleader = " "

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

------------------------------ Options ------------------------------
-- Global Status Line
opt.laststatus = 3
opt.showmode = false

-- Global Clipboard
opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- Disable Nvim Intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Interval for writing swap file to disk
opt.updatetime = 250

-- Wrap to next or previous line when cursor
-- reaches the end or beginning of line
opt.whichwrap:append("<>[]hl")

-- Disable default providers
for _, provider in ipairs({ "node", "perl", "python3", "ruby" }) do
	vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- Text Wrapping
opt.wrap = true
opt.breakindent = true

-- File System
opt.swapfile = false
opt.backup = false

-- Search
opt.hlsearch = false
opt.incsearch = true

-- Scroll
opt.scrolloff = 8
opt.isfname:append("@-@")

-- Right side column position
opt.colorcolumn = "100"
opt.textwidth = 100

------------------------------- Auto Commands -------------------------------

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
