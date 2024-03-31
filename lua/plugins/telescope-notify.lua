return {
	"rcarriga/nvim-notify",
	opts = function()
		return require("custom.configs.nvim-notify")
	end,
	config = function(_, opts)
		-- Setup nvim-notify
		local notify = require("notify")
		notify.setup(opts)

		-- Set nvim-notify as the global notification system
		vim.notify = notify

		-- Setup telescope extension
		require("telescope").setup({
			extensions = {
				["notify"] = {},
			},
		})
		require("telescope").load_extension("notify")
	end,
}
