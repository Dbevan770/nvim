return {
	"git@github.com:romgrk/barbar.nvim.git",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = function()
		return require("custom.configs.barbar")
	end,
}
