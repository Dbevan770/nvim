return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim',
    { 'j-hui/fidget.nvim', opts = {} },
    'folke/neodev.nvim',
  },
}