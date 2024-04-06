return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = function()
		return require("custom.configs.noice")
	end,
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function(_, opts)
		require("noice").setup(opts)
	end,
}
