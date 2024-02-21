local M = {}

M.servers = {
	bashls = {},
	clangd = {},
	cssls = {},
	dockerls = {},
	docker_compose_language_service = {},
	eslint = {},
	gopls = {
		cmd = { "gopls" },
		filetypes = { "go", "gomod", "gowork", "gotmpl" },
		completeUnimported = true,
		usePlaceholders = true,
		analyses = {
			unusedparams = true,
			shadow = true,
			fillreturns = true,
		},
		gofumpt = true,
		single_file_support = true,
	},
	gradle_ls = {},
	html = {
		filetypes = { "html", "twig", "hbs" },
	},
	jsonls = {},
	java_language_server = {},
	lua_ls = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
				},
			},
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
		},
	},
	marksman = {},
	omnisharp = {
		cmd = {
			"dotnet",
			"~/.local/share/nvim/mason/packages/omnisharp/libexec/OmniSharp.dll",
		},
		filetypes = { "cs", "vb" },
		enable_editiorconfig_support = true,
		enable_ms_build_load_projects_on_demand = false,
		enable_roslyn_analyzers = false,
		organize_imports_on_format = true,
		enable_import_completion = true,
		sdk_include_prereleases = true,
		analyze_open_documents_only = false,
		init_options = {},
	},
	pyright = {},
	sqls = {},
	tailwindcss = {},
	tsserver = {},
	yamlls = {},
}

M.opts = {
	ensure_installed = vim.tbl_keys(M.servers),
	PATH = "skip",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},

	max_concurrent_installers = 10,
}

return M
