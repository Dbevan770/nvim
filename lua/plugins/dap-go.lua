return {
	"leoluz/nvim-dap-go",
	ft = "go",
	dependencies = { "nvim-dap" },
	config = function(_, opts)
		local dap_go = require("dap-go")
		dap_go.setup(opts)

		vim.keymap.set("n", "<leader>dgt", function()
			dap_go.debug_test()
		end, {
			noremap = true,
			silent = true,
			desc = "[D]ebug [G]o [T]est",
		})

		vim.keymap.set("n", "<leader>dgl", function()
			dap_go.debug_last()
		end, {
			noremap = true,
			silent = true,
			desc = "[D]ebug [G]o [L]ast",
		})
	end,
}
