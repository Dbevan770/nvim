return {
	"nvim-telescope/telescope-github.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	opts = {
		["gh"] = {},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("gh")
	end,
}
