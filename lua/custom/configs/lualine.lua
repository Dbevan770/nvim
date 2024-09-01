local function git_branch()
	local branch = vim.b.gitsigns_head
	if branch == "main" or branch == "master" then
		return "  " .. branch
	else
		return "  " .. branch
	end
end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function lsp_status()
	local active_clients = vim.lsp.get_active_clients({
		bufnr = vim.api.nvim_get_current_buf(), -- Directly get the current buffer number
	})
	if #active_clients == 0 then
		return "󰒏  No Active LSP "
	end

	local lsp_name = ""

	for _, client in ipairs(active_clients) do
		if client.name ~= "null-ls" then
			lsp_name = "󰒋  LSP ~ " .. client.name .. " "
			return lsp_name
		elseif client.name == "copilot" and #active_clients == 1 then
			lsp_name = "󰒋 LSP ~ " .. client.name .. " "
			return lsp_name
		end
	end

	return lsp_name
end

local function folder_icon()
	return "󰉋 ", {
		cond = nil,
	}
end

local function stack_icon()
	return " ", {
		cond = nil,
	}
end

local function cwd()
	local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
	return dir_name
end

local opts = {
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		section_separators = {
			left = "",
			right = "",
		},
		component_separators = "",
	},
	sections = {
		lualine_a = {
			{
				"mode",
				separator = {
					left = "",
					right = "",
				},
				icon = "",
			},
			{
				"",
				draw_empty = true,
				separator = {
					left = "",
					right = "",
				},
				color = "LuaLineEmptySep",
			},
		},
		lualine_b = {
			{
				"filetype",
				colored = true,
				icon_only = true,
				icon = { align = "right" },
				padding = {
					left = 1,
					right = 1,
				},
			},
			{
				"filename",
				color = "LuaLineFilename",
				file_status = false,
				new_file_status = false,
				path = 0,
				separator = {
					left = "",
					right = "",
				},
				padding = {
					left = 1,
					right = 2,
				},
			},
			{
				"",
				draw_empty = true,
				separator = {
					left = "",
					right = "",
				},
				color = "LuaLineEmptySepB",
			},
		},
		lualine_c = {
			{
				git_branch,
				color = "LuaLineGitBranch",
			},
			{
				"diff",
				colored = true,
				symbols = {
					added = " ",
					modified = " ",
					removed = " ",
				},
				diff_color = {
					added = "LuaLineDiffAdd",
					modified = "LuaLineDiffChange",
					removed = "LuaLineDiffDelete",
				},
				source = diff_source,
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = {
					"nvim_lsp",
					"nvim_diagnostic",
					"coc",
				},
				sections = {
					"error",
					"warn",
					"info",
					"hint",
				},
				diagnostics_color = {
					error = "DiagnosticError",
					warn = "DiagnosticWarn",
					info = "DiagnosticInfo",
					hint = "DiagnosticHint",
				},
				symbols = {
					error = " ",
					warn = " ",
					info = "󰛩 ",
					hint = "󰋼 ",
				},
				colored = true,
				update_in_insert = true,
				always_visible = false,
			},
			{
				lsp_status,
				color = "LuaLineLspStatus",
			},
		},
		lualine_y = {
			{
				folder_icon,
				separator = {
					left = "",
					right = "",
				},
				color = "LuaLineFolderIcon",
				padding = 0,
			},
			{
				cwd,
				separator = {
					left = "",
					right = "",
				},
				color = "LuaLineCwd",
			},
		},
		lualine_z = {
			{
				stack_icon,
				separator = {
					left = "",
					right = "",
				},
				color = "LuaLineStackIcon",
				padding = 0,
			},
			{
				"progress",
				color = "LuaLineProgress",
			},
		},
	},
}

return opts
