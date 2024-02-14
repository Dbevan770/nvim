return {
	"mfussenegger/nvim-dap",
	init = function()
		-- Keymaps
		vim.keymap.set("n", "<leader>db", "<CMD>DapToggleBreakpoint<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap Toggle [B]reakpoint",
		})
		vim.keymap.set("n", "<leader>dc", "<CMD>DapContinue<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [C]ontinue",
		})
		vim.keymap.set("n", "<leader>dd", "<CMD>DapToggle<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [D]ebug",
		})
		vim.keymap.set("n", "<leader>dso", "<CMD>DapStepOver<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [S]tep [O]ver",
		})
		vim.keymap.set("n", "<leader>dsi", "<CMD>DapStepInto<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [S]tep [I]nto",
		})
		vim.keymap.set("n", "<leader>dsu", "<CMD>DapStepOut<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [S]tep O[u]t",
		})
		vim.keymap.set("n", "<leader>dl", "<CMD>DapLogPoint<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [L]og [P]oint",
		})
		vim.keymap.set("n", "<leader>dr", "<CMD>DapReplOpen<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [R]epl [O]pen",
		})
		vim.keymap.set("n", "<leader>dt", "<CMD>DapToggleRepl<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [T]oggle [R]epl",
		})
		vim.keymap.set("n", "<leader>du", "<CMD>DapUIOpen<CR>", {
			noremap = true,
			silent = true,
			desc = "[D]ap [U]I [O]pen",
		})
		vim.keymap.set("n", "<leader>tds", function()
			local widgets = require("dap.ui.widgets")
			local sidebar = widgets.sidebar(widgets.scopes)
			sidebar.toggle()
		end, {
			noremap = true,
			silent = true,
			desc = "[T]oggle [D]ap [S]idebar",
		})
	end,
}
