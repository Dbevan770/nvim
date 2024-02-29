return {
	"ellisonleao/carbon-now.nvim",
	lazy = true,
	cmd = "CarbonNow",
	---@param opts cn.ConfigSchema
	opts = function()
		return require("custom.configs.carbon")
	end,
	config = function(_, opts)
		require("carbon-now").setup(opts)
	end,
}
