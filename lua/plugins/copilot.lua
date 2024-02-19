return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	init = function()
		vim.keymap.set("n", "<leader>ta", function()
			require("copilot.suggestion").toggle_auto_trigger()
		end, {
			noremap = true,
			silent = true,
			desc = "Copilot [T]oggle [A]uto-trigger",
		})
	end,
	opts = function()
		return require("custom.configs.copilot")
	end,
	config = function(_, opts)
		require("copilot").setup(opts)
	end,
}
