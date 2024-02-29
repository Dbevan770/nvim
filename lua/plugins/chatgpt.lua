return {
	"jackMort/ChatGPT.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	opts = function()
		return require("custom.configs.chatgpt")
	end,
	config = function(_, opts)
		require("chatgpt").setup(opts)
	end,
}
