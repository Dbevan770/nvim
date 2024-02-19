return {
	"benfowler/telescope-luasnip.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	keys = {
		{
			"<leader>sl",
			"<CMD>Telescope luasnip<CR>",
			noremap = true,
			silent = true,
			desc = "[S]earch [L]ua snippets",
		},
	},
	opts = {
		extensions = {
			["luasnip"] = {
				require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("luasnip")
	end,
}
