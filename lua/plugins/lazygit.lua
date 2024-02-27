return {
	"kdheepak/lazygit.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telscope/telescope.nvim",
	},
	config = function()
		require("telescope").load_extension("lazygit")
	end,
}
