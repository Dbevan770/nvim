local null_ls = require("null-ls")

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
-- local hover = null_ls.builtins.hover

-- completion sources
local completion = null_ls.builtins.completion

local sources = {
	-- Code Actions
	code_actions.gitsigns, -- Git signs actions

	-- Completion
	completion.luasnip, -- Snippets support

	-- Diagnostics
	diagnostics.buf, -- Protobuf support
	diagnostics.mypy, -- Python support

	-- Formatters
	formatting.biome, -- Formatter for TS and JS
	formatting.black, -- Python formatter
	formatting.buf, -- Protobuf formatter
	formatting.csharpier, -- C# formatter
	formatting.goimports_reviser, -- Go formatter
	formatting.golines, -- Go formatter
	formatting.gofumpt, -- Go formatter
	formatting.prettier.with({
		filetypes = {
			"css",
			"scss",
			"less",
			"html",
			"jsonc",
			"yaml",
			"markdown",
			"markdown.mdx",
			"graphql",
			"handlebars",
		},
	}),
	formatting.stylua, -- Lua formatter
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local opts = {
	border = nil,
	cmd = { "nvim" },
	debounce = 250,
	debug = false,
	default_timeout = 5000,
	diagnostic_config = {},
	diagnostics_format = "#{m}",
	fallback_severity = vim.diagnostic.severity.ERROR,
	log_level = "warn",
	notify_format = "[null-ls] %s",
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({
				group = augroup,
				buffer = bufnr,
			})
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
	on_init = nil,
	on_exit = nil,
	root_dir = require("null-ls.utils").root_pattern(".null-ls-root", "Makefile", ".git"),
	root_dir_async = nil,
	should_attach = nil,
	sources = sources,
	temp_dir = nil,
	update_in_insert = false,
}

return opts
