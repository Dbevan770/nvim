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


local function icon_with_filename()
  local filename = vim.fn.expand("%:t")
  local extension = vim.fn.expand("%:e")
  local icon, _ = require("nvim-web-devicons").get_icon_by_filetype(extension)
  if icon == nil then
    icon = ""
  end

  local icon_and_filename = filename == "" and "" or icon .. " " .. filename

  return icon_and_filename
end


local function lsp_status()
  local active_clients = vim.lsp.get_active_clients({
    bufnr = vim.api.nvim_get_current_buf(), -- Directly get the current buffer number
  })
  if #active_clients == 0 then
    return "No Active LSP"
  end

  local lsp_name = ""

  for _, client in ipairs(active_clients) do
    if client.name ~= "null-ls" then
      lsp_name = "   LSP ~ " .. client.name
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

local function progress()
  if not rawget(vim, "lsp") or vim.lsp.status then
    return ""
  end

  local Lsp = vim.lsp.util.get_progress_messages()[1]
  if not Lsp then
    return ""
  end

  if Lsp.done then
    vim.defer_fn(function()
      vim.cmd.redrawstatus()
    end, 1000)
  end

  local msg = Lsp.message or ""
  local percentage = Lsp.percentage or 0
  local title = Lsp.title or ""
  local spinners = { "", "󰪞", "󰪟", "󰪠", "󰪢", "󰪣", "󰪤", "󰪥" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  local content = string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)

  return ("%#LuaLineProgress#" .. content) or ""
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
        " ",
        draw_empty = true,
        separator = {
          left = "",
          right = "",
        },
        color = "LuaLineEmptySep",
        padding = 2,
      },
    },
    lualine_b = {
      {
        icon_with_filename,
        separator = {
          left = "",
          right = "",
        },
      },
    },
    lualine_c = {
      {
        "b:gitsigns_head",
        icon = "",
        color = "LuaLineGitBranch",
      },
      {
        "diff",
        symbols = {
          added = "  ",
          modified = "  ",
          removed = "  ",
        },
        source = diff_source,
      },
      {
        progress,
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
