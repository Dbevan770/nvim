return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  keys = {
   '<leader>',
    '<c-r>',
    '<c-w>',
    '"',
    "'",
    "`",
    'c',
    'v',
    'g'
  },
  cmd = "WhichKey",
  config = function (_, opts)
    local which_key = require('which-key')
    which_key.setup(opts)

    which_key.register({
      ['<leader>b'] = { name = '[B]uffers', _ = 'which_key_ignore' },
      ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      ['<leader>d'] = { name = '[D]ebug', _ = 'which_key_ignore' },
      ['<leader>f'] = { name = '[F]ormat', _ = 'which_key_ignore' },
      ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      ['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
      ['<leader>l'] = { name = '[L]SP', _ = 'which_key_ignore' },
      ['<leader>n'] = { name = 'Dot[N]et', _ = 'which_key_ignore' },
      ['<leader>r'] = { name = '[R]ust', _ = 'which_key_ignore' },
      ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      ['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
      ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    })

    which_key.register({
      ['<leader>'] = { name = 'VISUAL <leader>' },
      ['<leader>h'] = { 'Git [H]unk' },
    }, { mode = 'v' })
  end
}
