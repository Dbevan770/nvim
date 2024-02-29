local opt = vim.opt
local g = vim.g

-------------------------- Global Options --------------------------
-- Map Leader
g.mapleader = " "
g.maplocalleader = " "

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Lazygit
g.lazygit_floating_window_winblend = 0
g.lazygit_floating_window_scaling_factor = 0.9
g.lazygit_floating_window_border_char = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
g.lazygit_floating_window_use_plenary = 0
g.lazygit_use_neovim_remote = 1

-- Lazygit custom config
g.lazygit_use_custom_config_file_path = 100
g.lazygit_config_file_path = os.getenv("XDG_CONFIG_HOME") .. "/lazygit/config.yml"

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

opt.signcolumn = "yes:2"
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
local augroup = vim.api.nvim_create_augroup -- Create an autogroup
local autocmd = vim.api.nvim_create_autocmd -- Create an autocmd

-- Store the git project directory into lazygit on load
local lazygit_group = augroup("Lazygit", { clear = true })
autocmd("BufEnter", {
	callback = function()
		local utils = require("lazygit.utils")
		utils.project_root_dir()
	end,
	group = lazygit_group,
	pattern = "*",
})

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
