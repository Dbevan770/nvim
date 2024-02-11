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

    -- Movement keybinds
    map('n', '<S-Tab>', '<CMD>BufferPrevious<CR>', default_options)
    map('n', '<Tab>', '<CMD>BufferNext<CR>', default_options)

    -- Pin current buffer
    map('n', '<A-p>', '<CMD>BufferPin<CR>', default_options)

    -- Close Buffer
    map('n', '<A-c>', '<CMD>BufferClose<CR>', default_options)
    -- Restore Buffer
    map('n', '<A-s-c>', '<CMD>BufferRestore<CR>', default_options)

    -- Magic? buffer picker mode
    map('n', '<C-p>', '<CMD>BufferPick<CR>', default_options)
    map('n', '<C-p>', '<CMD>BufferPickDelete', default_options)

    -- Buffer sorting
    map('n', '<leader>bb', '<CMD>BufferOrderByBufferNumber<CR>', default_options)
    map('n', '<leader>bd', '<CMD>BufferOrderByDirectory<CR>', default_options)
    map('n', '<leader>bl', '<CMD>BufferOrderByLanguage<CR>', default_options)
    map('n', '<leader>bw', '<CMD>BufferOrderByWindowNumber<CR>', default_options)
  end,
  opts = {
    animation = true,
    auto_hide = 1,
    clickable = false,
    focus_on_close = 'previous',
    hide = {
      extensions = false,
      inactive = false,
    },
    highlight_alternate = false,
    highlight_inactive_file_icons = true,
    highlight_visible = true,
    icons = {
      buffer_index = false,
      buffer_number = false,
      button = '✖',
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = {
          enabled = true,
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
      separator_at_end = true,
      modified = {
        button = '●',
        separator = {
          left = '',
          right = '',
        },
      },
      pinned = {
        button = '',
        filename = true,
        separator = {
          left = '',
          right = '',
        },
      },
      alternate = {
        filetype = {
          enabled = true
        },
        separator = {
          left = '',
          right = '',
        },
      },
      current = {
        buffer_index = false,
        separator = {
          left = '',
          right = '',
        },
      },
      inactive = {
        button = '×',
        separator = {
          left = '',
          right = '',
        },
      },
      visible = {
        modified = {
          buffer_number = false
        },
        separator = {
          left = '',
          right = '',
        },
      },
    },
    insert_at_start = false,
    letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',
    minimum_padding = 2,
    maximum_padding = 4,
    minimum_length = 0,
    maximum_length = 30,
    no_name_title = nil,
    semantic_letters = true,
    sidebar_filetypes = {
      NvimTree = {
        text = nil,
      },
      undotree = {
        text = nil,
      },
    },
    tabpages = true,
  },
  config = function(_, opts)
    require('barbar').setup(opts)
  end
}
