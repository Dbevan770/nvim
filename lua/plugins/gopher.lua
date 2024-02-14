return {
	"olexsmir/gopher.nvim",
	ft = "go",
	config = function(_, opts)
		require("gopher").setup(opts)

		vim.keymap.set("n", "<leader>gsj", "<cmd>GoTagAdd json<CR>", {
			noremap = true,
			silent = true,
			desc = "[G]o add [S]truct [J]son tags",
		})
		vim.keymap.set("n", "<leader>gsy", "<cmd>GoTagAdd yaml<CR>", {
			noremap = true,
			silent = true,
			desc = "[G]o add [S]truct [Y]aml tags",
		})
		vim.keymap.set("n", "<leader>gmt", "<cmd>GoModTidy<CR>", {
			noremap = true,
			silent = true,
			desc = "[G]o [M]odule [T]idy",
		})
		vim.keymap.set("n", "<leader>gta", "<cmd>GoTestsAll<CR>", {
			noremap = true,
			silent = true,
			desc = "[G]o [T]ests [A]ll",
		})
		vim.keymap.set("n", "<leader>gie", "<cmd>GoIfErr<CR>", {
			noremap = true,
			silent = true,
			desc = "[G]o [I]f [E]rror",
		})
	end,
	build = function()
		vim.cmd([[silent! GoInstallDeps]])
	end,
}
