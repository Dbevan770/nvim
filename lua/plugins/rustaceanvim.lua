return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  ft = 'rust',
  dependencies = 'neovim/nvim-lspconfig',
  init = function ()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local on_attach = require('mason-lspconfig').on_attach
    vim.g.rustaceanvim = {
      server = {
        capabilities = capabilities,
        on_attach = on_attach,
      },
    }
  end
}
