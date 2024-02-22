return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	},
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	opts = function()
		return require("custom.configs.mason-lspconfig").opts
	end,
	config = function(_, opts)
		local custom_config = require("custom.configs.mason-lspconfig")
		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup(opts)

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = custom_config.capabilities,
					on_attach = custom_config.on_attach,
					settings = custom_config.servers[server_name],
					filetypes = (custom_config.servers[server_name] or {}).filetypes,
				})
			end,
		})
	end,
}
