return {
  'lewis6991/gitsigns.nvim',
  event = 'User FilePost',
  opts = {
    signs = {
      add = { text = "│" },
      change = { text = "│" },
      delete = { text = "󰍵" },
      topdelete = { text = "‾" },
      changedelete = { text = "~" },
      untracked = { text = "│" },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      follow_files = true
    },
    auto_attach = true,
    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
      virt_text_priority = 100,
    },
    current_line_blame_formatter = function(name, blame_info)
      -- Replace author_name with 'You' if current user's 
      -- git config contains the same name
      local author = (name == blame_info.author and 'You') or blame_info.author

      -- Get the time for today in seconds
      -- Get the difference in time fron blame date
      -- Convert to days
      local now = os.time()
      local time_diff = now - blame_info.author_time
      local days_diff = math.floor(time_diff / (60 * 60 * 24))
      local year_in_days = 365.25

      local author_string

      -- When less than 1 year use relative time
      if days_diff < year_in_days then
        local current_day = os.date('*t')
        local author_day = os.date('*t', blame_info.author_time)

        if current_day.year == author_day.year and current_day.yday == author_day.yday then
          author_string = string.format('%s, Today at %s - %s',
            author,
            os.date('%I:%M %p', blame_info.author_time),
            blame_info.summary
          )
        elseif current_day.year == author_day.year and current_day.yday - 1 == author_day.yday then
          author_string = string.format('%s, Yesterday at %s - %s',
            author,
            os.date('%I:%M %p', blame_info.author_time),
            blame_info.summary
          )
        -- Less than 1 month (approx since using 30days)
        -- Show totals days since commit to now
        elseif days_diff < 30 then
          author_string = string.format('%s, %d days ago - %s',
            author,
            days_diff,
            blame_info.summary
          )
        -- If more than a month show months
        else
          author_string = string.format('%s, %d months ago - %s',
            author,
            math.floor(days_diff / 30),
            blame_info.summary
          )
        end
      -- If more than a year show actual date
      else
        author_string = string.format('%s, %s - %s',
          author,
          os.date('%d %b %Y', blame_info.author_time),
          blame_info.summary
        )
      end

      -- Return as list of tuples with
      -- (formatted_str, highlight_group)
      return {{author_string, 'GitSignsCurrentLineBlame'}}
    end,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = 'single',
      style = 'minimal',
      relative = 'cursor',
      row = 0,
      col = 1
    },
    yadm = {
      enable = false
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {
        expr = true,
        desc = 'Next Hunk'
      })

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {
        expr = true,
        desc = 'Previous Hunk',
      })

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk,
      { desc = 'Stage Hunk' })
      map('n', '<leader>hr', gs.reset_hunk,
      { desc = 'Reset Hunk' })
      map('v', '<leader>hs',
      function()
        gs.stage_hunk {
          vim.fn.line('.'),
          vim.fn.line('v')
        }
      end,
      { desc = "Stage Hunk (Visual)" })
      map('v', '<leader>hr',
      function()
        gs.reset_hunk
        {
          vim.fn.line('.'),
          vim.fn.line('v')
        }
      end,
      { desc = 'Reset Hunk (Visual)' })
      map('n', '<leader>hS', gs.stage_buffer,
      { desc = 'Stage Buffer' })
      map('n', '<leader>hu', gs.undo_stage_hunk,
      { desc = 'Undo Stage Hunk' })
      map('n', '<leader>hR', gs.reset_buffer,
      { desc = 'Reset Buffer' })
      map('n', '<leader>hp', gs.preview_hunk,
      { desc = 'Preview Hunk' })
      map('n', '<leader>hb', function() gs.blame_line{full=true} end,
      { desc = 'Git blame (Current Line)' })
      map('n', '<leader>tb', gs.toggle_current_line_blame,
      { desc = 'Git blame (Toggle)' })
      map('n', '<leader>hd', gs.diffthis,
      { desc = 'Git diff this' })
      map('n', '<leader>hD', function() gs.diffthis('~') end,
      { desc = 'Git diff this from root' })
      map('n', '<leader>td', gs.toggle_deleted,
      { desc = 'Toggle Deleted' })

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>',
      { desc = 'Gitsigns Select Hunk' })
    end
  },
  config = function (_, opts)
    require('gitsigns').setup(opts)
  end
}
