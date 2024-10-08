local M = {}

local nvim_lsp = require("lspconfig")
local util = nvim_lsp.util
local root_pattern = util.root_pattern
local mason_registry = require("mason-registry")
local vue_typescript_plugin = mason_registry
		.get_package('vue-language-server')
		:get_install_path()
		.. '/node_modules/@vue/language-sever/@vue/typescript-plugin'

M.servers = {
	bashls = {},
	biome = {
		cmd = { "biome", "lsp-proxy" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"typescript",
			"typescript.tsx",
			"typescriptreact",
			"astro",
			"svelte",
			"vue",
		},
		root_dir = nvim_lsp.util.root_pattern("biome.json", "biome.jsonc"),
		single_file_support = false,
	},
	bufls = {},
	clangd = {
		filetypes = { "c", "cpp", "objc", "objcpp" },
	},
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
	pyright = {},
	sqls = {},
	tsserver = {
		init_options = {
			plugins = {
				{
					name = "@vue/typescript-plugin",
					location = vue_typescript_plugin,
					languages = { "javascript", "typescript", "vue" },
				},
			},
		},
		filetypes = { "javascript", "typescript", "vue" },
	},
	volar = {},
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

M.on_attach = function(_, bufnr)
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = function()
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end
			nmap("<leader>lr", vim.lsp.buf.rename, "[L]SP [R]ename")
			nmap("<leader>lc", function()
				vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
			end, "[L]sp [C]ode Action")

			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-K>", vim.lsp.buf.signature_help, "Signature Documentation")

			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")

			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with LSP" })
		end,
	})
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(M.capabilities)

return M
