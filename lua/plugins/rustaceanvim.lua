return {
  'mrcjkb/rustaceanvim',
  version = '^4',
  ft = 'rust',
  dependencies = 'neovim/nvim-lspconfig',
  config = function ()
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    vim.g.rustaceanvim = {
      tools = {},
      server = {
        on_attach = function(_, bufnr)
          vim.keymap.set(
            'n',
            '<leader>ca',
            function()
              vim.cmd.RustLsp('codeAction')
            end,
            { silent = true, buffer = bufnr }
          )
        end,
        capabilities = capabilities
      },
      dap = {}
    }
  end
}
