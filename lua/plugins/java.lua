return {
	"mfussenegger/nvim-jdtls",
	opts = function()
		return require("custom.configs.java")
	end,
	config = function(_, opts)
		require("jdtls").start_or_attach(opts)
	end,
}
