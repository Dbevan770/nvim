return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		"williamboman/mason.nvim",
		"folke/neodev.nvim",
	},
	cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
	config = function()
		local servers = {
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

		local on_attach = function(_, bufnr)
			local builtin = require("telescope.builtin")
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			nmap("<leader>lr", vim.lsp.buf.rename, "[L]SP [R]ename")
			nmap("<leader>ca", function()
				vim.lsp.buf.code_action({ context = { only = { "quickfix", "refactor", "source" } } })
			end, "[C]ode [A]ction")

			nmap("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
			nmap("gr", builtin.lsp_references, "[G]oto [R]eferences")
			nmap("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
			nmap("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
			nmap("<leader>lds", builtin.lsp_document_symbols, "[L]sp [D]ocument [S]ymbols")
			nmap("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

			nmap("K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder")
			nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder")
			nmap("<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, "[W]orkspace [L]ist Folders")

			vim.api.nvim_buf_create_user_command(bufnr, "Format", function(_)
				vim.lsp.buf.format()
			end, { desc = "Format current buffer with LSP" })
		end

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

		local mason_lspconfig = require("mason-lspconfig")

		mason_lspconfig.setup({
			ensure_installed = vim.tbl_keys(servers),
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
		})

		mason_lspconfig.setup_handlers({
			function(server_name)
				require("lspconfig")[server_name].setup({
					capabilities = capabilities,
					on_attach = on_attach,
					settings = servers[server_name],
					filetypes = (servers[server_name] or {}).filetypes,
				})
			end,
		})
	end,
}
