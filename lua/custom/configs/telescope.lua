local opts = {
	defaults = {
		sorting_strategy = "ascending",
		selection_strategy = "reset",
		scroll_strategy = "cycle",
		layout_strategy = "horizontal",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
				results_width = 0.8,
			},
			vertical = {
				mirror = false,
			},
			width = 0.87,
			height = 0.80,
			preview_cutoff = 120,
		},
		cycle_layout_list = {
			"horizontal",
			"vertical",
		},
		winblend = 0,
		wrap_results = false,
		prompt_prefix = "   ",
		selection_caret = "  ",
		entry_prefix = "  ",
		multi_icon = "+",
		initial_mode = "insert",
		border = {},
		path_display = {
			"truncate",
		},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
		vimgrep_arguments = {
			"rg",
			"-L",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
		},
		set_env = { ["COLORTERM"] = "truecolor" },
		color_devicons = true,
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		generic_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { "node_modules" },
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
	},
}

return opts
