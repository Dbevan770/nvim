return {
  'nvim-tree/nvim-tree.lua',
  version = "*",
  lazy = false,
  cmd = {
    "NvimTreeToggle",
    "NvimTreeFocus"
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  init = function ()
    vim.keymap.set("n", "<C-n>", "<cmd>NvimTreeToggle<CR>")
  end,
  opts = {
    filters = {
      git_ignored = false,
      dotfiles = false,
      git_clean = false,
      no_buffer = false,
      no_bookmark = false,
      exclude = {
        vim.fn.stdpath "config" .. "/lua/custom"
      },
    },
    disable_netrw = true,
    hijack_netrw = true,
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      adaptive_size = false,
      side = "left",
      width = 30,
      preserve_window_proportions = false,
    },
    git = {
      enable = false,
      ignore = true,
    },
    filesystem_watchers = {
      enable = true,
    },
    actions = {
      open_file = {
        resize_window = true,
      },
    },
    sort = {
      sorter = "name",
    },
    renderer = {
      root_folder_label = false,
      highlight_git = false,
      highlight_opened_files = "none",

      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "└",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },

      icons = {
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = false,
        },

        glyphs = {
          default = "󰈚",
          symlink = "",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
            symlink_open = "",
            arrow_open = "",
            arrow_closed = "",
          },
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "★",
            deleted = "",
            ignored = "◌",
          },
        },
      },
    },
  },
  config = function (_, opts)
    require('nvim-tree').setup(opts)
  end
}
