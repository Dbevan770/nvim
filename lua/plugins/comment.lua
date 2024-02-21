return {
	"numToStr/Comment.nvim",
	lazy = false,
	keys = {
		{ "tcc", mode = "n", desc = "[T]oggle [C]omment [C]urrent Line" },
		{ "tcl", mode = { "n", "o" }, desc = "[T]oggle [C]omment [L]inewise" },
		{ "tcl", mode = "x", desc = "[T]oggle [C]omment [L]inewise" },
		{ "tcb", mode = "n", desc = "[T]oggle [C]omment Current [B]lock" },
		{ "tcbw", mode = { "n", "o" }, desc = "[T]oggle [C]omment [B]lock[w]ise" },
		{ "tcbw", mode = "x", desc = "[T]oggle [C]omment [B]lock[w]ise" },
	},
	opts = function()
		return require("custom.configs.comment")
	end,
}
