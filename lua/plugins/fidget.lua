return {
	"j-hui/fidget.nvim",
	opts = function()
		return require("custom.configs.fidget")
	end,
	config = function(_, opts)
		require("fidget").setup(opts)
	end,
}
