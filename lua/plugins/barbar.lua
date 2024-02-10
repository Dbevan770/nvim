return {
  'romgrk/barbar.nvim',
  dependencies = {
    'lewis6991/gitsigns.nvim',
    'nvim-tree/nvim-web-devicons',
  },
  init = function()
    local map = vim.keymap.set
    local default_options = {
      noremap = true,
      silent = true
    }

    vim.g.barbar_auto_setup = false

    map('n', '<S-Tab>', '<CMD>BufferPrevious<CR>', default_options)
    map('n', '<Tab>', '<CMD>BufferNext<CR>', default_options)

  end,
  opts = {
    animation = true,
    auto_hide = false,
    clickable = false,
    focus_on_close = 'left',
    hide = {
      extensions = false,
      inactive = false,
    },
    highlight_alternate = false,
    highlight_inactive_file_icons = false,
    highlight_visible = true,
    icons = {
      buffer_index = false,
      buffer_number = false,
      button = '✖',
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = {
          enabled = true,
          icon = 'ﬀ'
        },
        [vim.diagnostic.severity.WARN] = {
          enabled = false
        },
        [vim.diagnostic.severity.INFO] = {
          enabled = false
        },
        [vim.diagnostic.severity.HINT] = {
          enabled = true
        },
      },
      gitsigns = {
        added = {
          enabled = false,
          icon = '+'
        },
        changed = {
          enabled = false,
          icon = '~'
        },
        deleted = {
          enabled = false,
          icon = '-'
        },
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = {
        left = '',
        right = ''
      },
      separator_at_end = false,
      modified = {
        button = '●'
      },
      pinned = {
        button = '',
        filename = true
      },
      alternate = {
        filetype = {
          enabled = true
        }
      },
      current = {
        buffer_index = false
      },
      inactive = {
        button = '×'
      },
      visible = {
        modified = {
          buffer_number = false
        }
      },
    },
    insert_at_start = true,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    minimum_padding = 1,
    maximum_padding = 1,
    minimum_length = 0,
    maximum_length = 30,
    no_name_title = nil,
    semantic_letters = true,
    sidebar_filetypes ={
      NvimTree = true,
    },
    tabpages = true,
  },
  config = function(_, opts)
    require('barbar').setup(opts)
  end
}
