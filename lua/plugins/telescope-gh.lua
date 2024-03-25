return {
	"nvim-telescope/telescope-github.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	config = function()
		require("telescope").load_extension("gh")
	end,
}
