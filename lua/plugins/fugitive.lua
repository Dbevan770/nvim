return {
  'tpope/vim-fugitive',
  init = function ()
    local map = vim.keymap.set

    map("n", "<leader>gs", vim.cmd.Git,
      { desc = "Open Git Status windows" }
    )
    map('n', '<leader>gb', '<CMD>Git blame<CR>',
      { desc = 'Run Git blame on current file'}
    )
    map('n', '<leader>gd', '<CMD>Git difftool<CR>', {
      desc = 'Opens Git Difftool'
    })
    map('n', '<leader>gm', '<CMD>Git mergetool<CR>', {
      desc = 'Open merge tool to resolve merge conflicts'
    })
    map('n', '<leader>gl', '<CMD>Git log --oneline<CR>', {
      desc = "Open Git Log"
    })
    map('n', '<leader>gA', '<CMD>Gwrite<CR>', {
      desc = 'Git add current buffer'
    })
    map('n', '<leader>gaq', '<CMD>Gwq<CR>', {
      desc = 'Git add and close buffer'
    })
    map('n', '<leader>gaQ', '<CMD>Gwq!<CR>', {
      desc = 'Force git add and close buffer'
    })
    map('n', '<leader>gD', '<CMD>GDelete<CR>', {
      desc = 'Git remove file and delete buffer'
    })
    map('n', '<leader>gdD', '<CMD>GDelete!<CR>', {
      desc = 'Git rm file and pass -f force flag'
    })
    map('n', '<leader>gR', '<CMD>GRemove<CR>', {
      desc = 'Git rm but keep buffer (now empty)'
    })
    map('n', '<leader>gB', '<CMD>GBrowse<CR>', {
      desc = 'Open Browser and navigate to upstream repo host'
    })
  end
}
