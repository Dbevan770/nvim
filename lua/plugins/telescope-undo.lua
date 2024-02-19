return {
	"debugloop/telescope-undo.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	keys = {
		{
			"<leader>su",
			"<CMD>Telescope undo<CR>",
			desc = "[S]earch [U]ndo tree",
		},
	},
	opts = {
		extensions = {
			undo = {
				require("telescope.themes").get_dropdown({}),
				side_by_side = true,
				layout_strategy = "vertical",
				layout_config = {
					preview_height = 0.8,
				},
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("undo")
	end,
}
