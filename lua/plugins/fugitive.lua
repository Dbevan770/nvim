return {
  'tpope/vim-fugitive',
  init = function ()
    local map = vim.keymap.set

    map("n", "<leader>gs", vim.cmd.Git,
      { desc = "Open [G]it [S]tatus windows" }
    )
    map('n', '<leader>gb', '<CMD>Git blame<CR>',
      { desc = 'Run [G]it [B]lame on current file'}
    )
    map('n', '<leader>gd', '<CMD>Git difftool<CR>', {
      desc = 'Open [G]it [D]iff tool'
    })
    map('n', '<leader>gm', '<CMD>Git mergetool<CR>', {
      desc = 'Open [G]it [M]erge tool to resolve merge conflicts'
    })
    map('n', '<leader>gl', '<CMD>Git log --oneline<CR>', {
      desc = "Open [G]it [L]og"
    })
    map('n', '<leader>gp', '<CMD>Git push<CR>', {
      desc = '[G]it [P]ush current commits'
    })
    map('n', '<leader>gA', '<CMD>Gwrite<CR>', {
      desc = '[G]it [A]dd current buffer'
    })
    map('n', '<leader>gaq', '<CMD>Gwq<CR>', {
      desc = '[G]it [A]dd and close buffer'
    })
    map('n', '<leader>gaQ', '<CMD>Gwq!<CR>', {
      desc = 'Force [G]it [A]dd and close buffer'
    })
    map('n', '<leader>gD', '<CMD>GDelete<CR>', {
      desc = '[G]it remove file and [D]elete buffer'
    })
    map('n', '<leader>gdD', '<CMD>GDelete!<CR>', {
      desc = 'Git rm file and pass -f force flag'
    })
    map('n', '<leader>gR', '<CMD>GRemove<CR>', {
      desc = 'Git rm but keep buffer (now empty)'
    })
  end
}
