return {
	"jvgrootveld/telescope-zoxide",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	opts = function()
		local t = require("telescope")
		local z_utils = require("telescope._extensions.zoxide.utils")
		return {
			extensions = {
				["zoxide"] = {
					prompt_title = "Zoxide",
					list_command = "zoxide query -ls",
					mappings = {
						default = {
							action = function(selection)
								vim.cmd.edit(selection.path)
							end,
							after_action = function(selection)
								print("Directory changed to " .. selection.path)
							end,
						},
						["<C-s>"] = { action = z_utils.create_basic_command("split") },
						["<C-v>"] = { action = z_utils.create_basic_command("vsplit") },
						["<C-e>"] = { action = z_utils.create_basic_command("edit") },
						["<C-b>"] = {
							keepinsert = true,
							action = function(selection)
								t.builtin.file_browser({ cwd = selection.path })
							end,
						},
						["<C-f>"] = {
							keepinsert = true,
							action = function(selection)
								t.builtin.find_files({ cwd = selection.path })
							end,
						},
						["<C-t>"] = {
							action = function(selection)
								vim.cmd.tcd(selection.path)
							end,
						},
					},
				},
			},
		}
	end,
	config = function(_, opts)
		local t = require("telescope")
		t.setup(opts)
		t.load_extension("zoxide")

		vim.keymap.set("n", "<leader>z", t.extensions.zoxide.list)
	end,
}
