return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{ "saadparwaiz1/cmp_luasnip" },
		{ "neovim/nvim-lspconfig" },
		{ "hrsh7th/cmp-nvim-lua" },
		{ "hrsh7th/cmp-nvim-lsp" },
		{ "hrsh7th/cmp-buffer" },
		{ "hrsh7th/cmp-path" },
		{ "hrsh7th/cmp-cmdline" },
	},
	opts = function()
		return require("custom.configs.cmp").opts
	end,
}
