local opts = {
	animation = true,
	auto_hide = 0,
	clickable = false,
	focus_on_close = "previous",
	hide = {
		extensions = false,
		inactive = false,
	},
	highlight_alternate = false,
	highlight_inactive_file_icons = true,
	highlight_visible = true,
	icons = {
		buffer_index = false,
		buffer_number = false,
		button = "",
		diagnostics = {
			[vim.diagnostic.severity.ERROR] = {
				enabled = true,
			},
			[vim.diagnostic.severity.WARN] = {
				enabled = false,
			},
			[vim.diagnostic.severity.INFO] = {
				enabled = false,
			},
			[vim.diagnostic.severity.HINT] = {
				enabled = true,
			},
		},
		gitsigns = {
			added = {
				enabled = false,
				icon = "+",
			},
			changed = {
				enabled = false,
				icon = "~",
			},
			deleted = {
				enabled = false,
				icon = "-",
			},
		},
		filetype = {
			custom_colors = false,
			enabled = true,
		},
		separator_at_end = true,
		modified = {
			button = "●",
			separator = {
				left = "",
				right = "",
			},
		},
		pinned = {
			button = "",
			filename = true,
			separator = {
				left = "",
				right = "",
			},
		},
		alternate = {
			filetype = {
				enabled = true,
			},
			separator = {
				left = "",
				right = "",
			},
		},
		current = {
			buffer_index = false,
			separator = {
				left = "",
				right = "",
			},
		},
		inactive = {
			button = "󰅖",
			separator = {
				left = "",
				right = "",
			},
		},
		visible = {
			modified = {
				buffer_number = false,
			},
			separator = {
				left = "",
				right = "",
			},
		},
	},
	insert_at_start = false,
	letters = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP",
	minimum_padding = 2,
	maximum_padding = 2,
	minimum_length = 0,
	maximum_length = 30,
	no_name_title = nil,
	semantic_letters = true,
	sidebar_filetypes = {
		NvimTree = {
			text = nil,
		},
		undotree = {
			text = nil,
		},
	},
	tabpages = true,
	exclude_ft = {
		"gitcommit",
		"dashboard",
	},
}

return opts
