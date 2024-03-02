return {
	"code-biscuits/nvim-biscuits",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	build = ":TSUpdate",
	opts = function()
		return require("custom.configs.biscuit")
	end,
	config = function(_, opts)
		require("nvim-biscuits").setup(opts)
	end,
}
