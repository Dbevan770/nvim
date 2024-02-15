return {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function()
		return require("custom.configs.null-ls")
	end,
	config = function(_, opts)
		require("null-ls").setup(opts)
	end,
}
