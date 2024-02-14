return {
  'saecki/crates.nvim',
  tag = 'stable',
  event = { "BufRead Cargo.toml" },
  opts = {},
  config = function (_, opts)
    local crates = require('crates')
    crates.setup(opts)

    vim.keymap.set('n', '<leader>rcu', function ()
      crates.update_all_crates()
    end, {
      noremap = true,
      silent = true,
      desc = '[R]ust [C]rates [U]pdate'
    })
  end
}
