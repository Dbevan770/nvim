return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				-- NOTE: If you are having trouble with this installation,
				--       refer to the README for telescope-fzf-native for more instructions.
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
		},
		cmd = {
			"Telescope",
		},
		init = function()
			local builtin = require("telescope.builtin")
			local map = vim.keymap.set

			map("n", "<leader>?", builtin.oldfiles, {
				desc = "[?] Find recently opened files",
			})
			map("n", "<leader><space>", builtin.buffers, {
				desc = "[ ] Find existing buffers",
			})
			map("n", "<leader>/", function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			local function telescope_live_grep_open_files()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end

			map("n", "<leader>s/", telescope_live_grep_open_files, {
				desc = "[S]earch [/] in Open Files",
			})
			map("n", "<leader>ss", builtin.builtin, {
				desc = "[S]earch [S]election telescope",
			})
			map("n", "<leader>gf", builtin.git_files, {
				desc = "Search in [G]it [F]iles",
			})
			map("n", "<leader>sf", builtin.find_files, {
				desc = "[S]earch [F]iles",
			})
			map("n", "<leader>sh", builtin.help_tags, {
				desc = "[S]earch [H]elp",
			})
			map("n", "<leader>sw", builtin.grep_string, {
				desc = "[S]earch current [W]ord",
			})
			map("n", "<leader>sg", builtin.live_grep, {
				desc = "[S]earch by [G]rep",
			})
			map("n", "<leader>sd", builtin.diagnostics, {
				desc = "[S]earch [D]iagnostics",
			})
			map("n", "<leader>sr", builtin.resume, {
				desc = "[S]earch [R]esume",
			})
			map("n", "<leader>ss", "<CMD>Telescope luasnip<CR>", {
				desc = "[S]earch [S]nippets",
			})
		end,
		opts = {
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown({}),
				},
				["luasnip"] = {
					require("telescope.themes").get_dropdown({}),
				},
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			telescope.setup(opts)
			telescope.load_extension("ui-select")
			telescope.load_extension("luasnip")
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
	},
	{
		"benfowler/telescope-luasnip.nvim",
	},
}
