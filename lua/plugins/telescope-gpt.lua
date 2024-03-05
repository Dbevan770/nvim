return {
	"HPRIOR/telescope-gpt",
	dependencies = { "nvim-telescope/telescope.nvim", "jackMort/ChatGPT.nvim" },
	opts = {
		extensions = {
			["gpt"] = {
				title = "ChatGPT Actions",
				commands = {
					"add_tests",
					"chat",
					"docstring",
					"explain_code",
					"fix_bugs",
					"grammar_correction",
					"interactive",
					"optimize_code",
					"summarize",
					"translate",
				},
				theme = require("telescope.themes").get_dropdown({}),
			},
		},
	},
	config = function(_, opts)
		require("telescope").setup(opts)
		require("telescope").load_extension("gpt")

		vim.keymap.set("n", "<leader>ca", "<CMD>Telescope gpt<CR>", {
			noremap = true,
			silent = true,
			desc = "[C]hatGPT [A]ctions",
		})
	end,
}
