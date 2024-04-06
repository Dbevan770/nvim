return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = function()
		return require("custom.configs.blankline")
	end,
	config = function(_, opts)
		require("ibl").setup(opts)
	end,
}
