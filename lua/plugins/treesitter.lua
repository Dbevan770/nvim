return {
  'nvim-treesitter/nvim-treesitter',
  event = {
    'BufReadPost',
    'BufNewFile'
  },
  cmd = {
    'TSInstall',
    'TSBufEnable',
    'TSBufDisable',
    'TSModuleInfo',
  },
  build = ':TSUpdate',
  init = function()
    require('nvim-treesitter.configs').setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false
      }
    })
  end
}
