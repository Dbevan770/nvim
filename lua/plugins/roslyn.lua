return {
	"jmederosalvarado/roslyn.nvim",
	config = function()
		local lspconfig = require("custom.configs.mason-lspconfig")
		require("roslyn").setup({
			dotnet_cmd = "dotnet",
			roslyn_version = "4.8.0-3.23475.7",
			on_attach = lspconfig.on_attach,
			capabilities = lspconfig.capabilities,
		})
	end,
}
