return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = {
      "Telescope"
    },
    init = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
      vim.keymap.set('n', '<leader>gf', builtin.git_files, {})
    end,
    opts = {
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown {}
        }
      }
    },
    config = function (_, opts)
      local telescope = require('telescope')
      telescope.setup(opts)
      telescope.load_extension('ui-select')
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim'
  }
}
