return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeFocus",
	},
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
	end,
	opts = function()
		return require("custom.configs.nvim-tree")
	end,
	config = function(_, opts)
		require("nvim-tree").setup(opts)
	end,
}
