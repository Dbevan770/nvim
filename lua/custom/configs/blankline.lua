local opts = {
	enabled = true,
	debounce = 200,
	scope = {
		enabled = true,
	},
	exclude = {
		filetypes = {
			"dashboard",
			"lspinfo",
			"packer",
			"checkhealth",
			"help",
			"man",
			"gitcommit",
			"TelescopePrompt",
			"TelescopeResults",
			"''",
		},
	},
}

return opts
