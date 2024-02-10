return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'williamboman/mason.nvim'
  },
  init = function ()
    vim.keymap.set(
    "n",
    "<leader>e",
    "<cmd>lua vim.diagnostic.open_float()<CR>"
    )
    vim.keymap.set(
    "n",
    "[d",
    "<cmd>lua vim.diagnostic.goto_prev()<CR>"
    )
    vim.keymap.set(
    "n",
    "]d",
    "<cmd>lua vim.diagnostic.goto_next()<CR>"
    )

    vim.api.nvim_create_autocmd('LspAttach', {
      desc = 'LSP actions',
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(event)
        local opts = {buffer = event.buf}

        vim.keymap.set(
        "n",
        "K",
        "<cmd>lua vim.lsp.buf.hover()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "gd",
        "<cmd>lua vim.lsp.buf.definition()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "gD",
        "<cmd>lua vim.lsp.buf.declaration()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "gi",
        "<cmd>lua vim.lsp.buf.implementation()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "go",
        "<cmd>lua vim.lsp.buf.type_definition()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "gr",
        "<cmd>lua vim.lsp.buf.references()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "gs",
        "<cmd>lua vim.lsp.buf.signature_help()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "<leader>vrn",
        "<cmd>lua vim.lsp.buf.rename()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "<leader>vws",
        "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "<leader>ca",
        "<cmd>lua vim.lsp.buf.code_action()<cr>",
        opts
        )
        vim.keymap.set(
        "n",
        "<leader>bf",
        "<cmd>lua vim.lsp.buf.format({async = true})<cr>",
        opts
        )
      end
    })
  end,
  config = function ()
    local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require('lspconfig')

    -- Custom server configuration
    lspconfig.lua_ls.setup({
      capabilities = lsp_capabilities,
      settings = {
        Lua = {
          runtime = {
            version = "LuaJIT"
          },
          diagnostics = {
            globals = {
              'vim'
            }
          },
          workspace = {
            library = {
              [vim.fn.expand "$VIMRUNTIME/lua"] = true,
              [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
              [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
            },
            maxPreload = 100000,
            preloadFileSize = 10000,
          },
        },
      },
    })
  end
}
