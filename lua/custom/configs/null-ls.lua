local null_ls = require("null-ls")
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
	sources = {
		-- Diagnostics
		null_ls.builtins.diagnostics.mypy,
		null_ls.builtins.diagnostics.ruff,
		-- Formatters
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.csharpier,
		null_ls.builtins.formatting.goimports_reviser,
		null_ls.builtins.formatting.golines,
		null_ls.builtins.formatting.gofumpt,
	},
	temp_dir = nil,
	update_in_insert = false,
}

return opts
