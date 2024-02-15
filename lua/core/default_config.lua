local M = {}

-- Some options for data
M.options = {
	title = "Danny's Neovim Config",
}

-- Default UI settings
M.ui = {
	theme = "catppuccin",
	transparency = false,
}

-- Empty table for plugins
M.plugins = 'custom.plugins'

-- Path to the lazy nvim config
M.lazy_nvim = require("plugins.configs.lazy_nvim")

-- Default key mappings
M.mappings = require("core.mappings")

return M
