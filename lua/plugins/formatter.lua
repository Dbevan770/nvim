return {
	"mhartington/formatter.nvim",
	config = function()
		vim.keymap.set("n", "<leader>ff", "<CMD>Format<CR>", {
			noremap = true,
			silent = true,
			desc = "[F]ormat [F]ile",
		})
		vim.keymap.set("n", "<leader>fw", "<CMD>FormatWrite<CR>", {
			noremap = true,
			silent = true,
			desc = "[F]ormat [W]rite",
		})

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = "FormatWrite",
		})

		local util = require("formatter.util")

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.WARN,
			filetype = {
				lua = {
					function()
						if util.get_current_buffer_file_name() == "special.lua" then
							return nil
						end

						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				go = {
					function()
						return {
							exe = "gofumpt",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
					function()
						return {
							exe = "goimports-reviser",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
					function()
						return {
							exe = "golines",
							args = {
								util.escape_path(util.get_current_buffer_file_path()),
							},
							stdin = true,
						}
					end,
				},
				cs = {
					require("formatter.filetypes.cs").dotnetformat,
					require("formatter.filetypes.cs").csharpier,
				},

				-- Use the special "*" filetype for defining formatter configurations on
				-- any filetype
				["*"] = {
					-- "formatter.filetypes.any" defines default configurations for any
					-- filetype
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
