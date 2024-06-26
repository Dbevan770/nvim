return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		"<leader>",
		"<c-r>",
		"<c-w>",
		'"',
		"'",
		"`",
		"c",
		"v",
		"g",
	},
	cmd = "WhichKey",
	config = function(_, opts)
		local which_key = require("which-key")
		which_key.setup(opts)

		which_key.register({
			["<leader>a"] = { name = "Code [A]ctions", _ = "which_key_ignore" },
			["<leader>b"] = { name = "[B]uffers", _ = "which_key_ignore" },
			["<leader>d"] = { name = "[D]ebug", _ = "which_key_ignore" },
			["<leader>f"] = { name = "[F]ormat", _ = "which_key_ignore" },
			["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
			["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
			["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
			["<leader>p"] = { name = "[P]ackage Manager", _ = "which_key_ignore" },
			["<leader>r"] = { name = "[R]ust", _ = "which_key_ignore" },
			["<leader>rc"] = { name = "[R]ust [C]argo", _ = "which_key_ignore" },
			["<leader>re"] = { name = "[R]ust [E]xplain", _ = "which_key_ignore" },
			["<leader>rj"] = { name = "[R]ust [J]oin", _ = "which_key_ignore" },
			["<leader>ro"] = { name = "[R]ust [O]pen", _ = "which_key_ignore" },
			["<leader>rr"] = { name = "[R]ust [R]ender", _ = "which_key_ignore" },
			["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
			["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
			["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
			["<leader>z"] = { name = "[Z]oxide", _ = "which_key_ignore" },

			["t"] = { name = "[T]oggle Comments", _ = "which_key_ignore" },
			["tc"] = { name = "[C]omments", _ = "which_key_ignore" },
		})

		which_key.register({
			["<leader>"] = { name = "VISUAL <leader>" },
			["<leader>h"] = { "Git [H]unk" },
		}, { mode = "v" })
	end,
}
