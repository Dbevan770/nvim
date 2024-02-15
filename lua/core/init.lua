local opt = vim.opt
local g = vim.g
local config = require("core.utils").load_config()

---------------------------- Globals ----------------------------
-- Map Leader
g.mapleader = " "

-- Set the title
g.title = config.options.title

-- Disable netrw
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

-- Set the theme
g.theme = config.ui.theme

-- Set the transparency
g.transparency = config.ui.transparency

---------------------------- Options ----------------------------
-- Global Status Line
opt.laststatus = 3
opt.showmode = false

opt.clipboard = "unnamedplus"
opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smartindent = true

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Line Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- Disable NIntro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- Update Time
opt.updatetime = 250

-- Wrap to next or previous line when moving left or right
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

---------------------------- Autocommands ----------------------------
local autocmd = vim.api.nvim_create_autocmd

-- Don't list quickfix Buffers
-- autocmd("FileType", {
-- 	pattern = "qf",
-- 	callback = function()
-- 		vim.opt_local.buflisted = false
-- 	end,
-- })

-- Reload Dannyrc on Save
-- autocmd("BufWritePost", {
-- 	pattern = vim.tbl_map(function(path)
-- 		return vim.fs.normalize(vim.loop.fs_realpath(path))
-- 	end, vim.fn.glob(vim.fn.stdpath("config") .. "/lua/custom/**/*.lua", true, true, true)),
-- 	group = vim.api.nvim_create_augroup("ReloadDannyNvim", {}),
--
-- 	callback = function(opts)
-- 		local fp = vim.fn.fnamemodify(vim.fs.normalize(vim.api.nvim_buf_get_name(opts.buf)), ":r") --[[@as string]]
-- 		local app_name = vim.env.NVIM_APPNAME and vim.env.NVIM_APPNAME or "nvim"
-- 		local module = string.gsub(fp, "^.*/" .. app_name .. "/lua/", ""):gsub("/", ".")
--
-- 		require("plenary.reload").reload_module(module)
-- 		require("plenary.reload").reload_module("custom.dannyrc")
--
-- 		config = require("core.utils").load_config()
--
-- 		vim.g.theme = config.ui.theme
-- 		vim.g.transparency = config.ui.transparency
-- 		vim.g.title = config.options.title
-- 	end,
-- })

-- vim.api.nvim_create_autocmd({ "UIEnter", "BufReadPost", "BufNewFile" }, {
-- 	group = vim.api.nvim_create_augroup("NvFilePost", { clear = true }),
-- 	callback = function(args)
-- 		local file = vim.api.nvim_buf_get_name(args.buf)
-- 		local buftype = vim.api.nvim_buf_get_option(args.buf, "buftype")
--
-- 		if not vim.g.ui_entered and args.event == "UIEnter" then
-- 			vim.g.ui_entered = true
-- 		end
--
-- 		if file ~= "" and buftype ~= "nofile" and vim.g.ui_entered then
-- 			vim.api.nvim_exec_autocmds("User", { pattern = "FilePost", modeline = false })
-- 			vim.api.nvim_del_augroup_by_name("NvFilePost")
--
-- 			vim.schedule(function()
-- 				vim.api.nvim_exec_autocmds("FileType", {})
-- 				require("editorconfig").config(args.buf)
-- 			end)
-- 		end
-- 	end,
-- })
