return {
	"MeanderingProgrammer/markdown.nvim",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	ft = "markdown",
	opts = function()
		return require("custom.configs.markdown")
	end,
	config = function(_, opts)
		require("render-markdown").setup(opts)
	end,
}
