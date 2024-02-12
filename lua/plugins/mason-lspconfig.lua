return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim'
  },
  cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
  opts = {
    PATH = "skip",

    ui = {
      icons = {
        package_pending = " ",
        package_installed = "󰄳 ",
        package_uninstalled = " 󰚌",
      },

      keymaps = {
        toggle_server_expand = "<CR>",
        install_server = "i",
        update_server = "u",
        check_server_version = "c",
        update_all_servers = "U",
        check_outdated_servers = "C",
        uninstall_server = "X",
        cancel_installation = "<C-c>",
      },
    },

    max_concurrent_installers = 10,
  },
  config = function (_, opts)
    local servers = {
      bashls = {},
      clangd = {},
      cssls = {},
      dockerls = {},
      docker_compose_language_service = {},
      eslint = {},
      gopls = {},
      gradle_ls = {},
      html = {
        filetypes = { 'html', 'twig', 'hbs'},
      },
      jsonls = {},
      java_language_server = {},
      lua_ls = {
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
      marksman = {},
      omnisharp = {},
      pyright = {},
      rust_analyzer = {},
      sqls = {},
      tailwindcss = {},
      tsserver = {},
      yamlls = {},
    }


    local on_attach = function(_, bufnr)
      local builtin = require('telescope.builtin')
      local nmap = function (keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', function ()
        vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
      end, '[C]ode [A]ction')

      nmap('gd', builtin.lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', builtin.lsp_references, '[G]oto [R]eferences')
      nmap('gI', builtin.lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', builtin.lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', builtin.lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', builtin.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
    end

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    local mason_lspconfig = require('mason-lspconfig')

    mason_lspconfig.setup(opts)

    vim.api.nvim_create_user_command("MasonInstallAll", function ()
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        vim.cmd('MasonInstall ' .. table.concat(opts.ensure_installed, ' '))
      end
    end, {})

    vim.g.mason_binaries_list = opts.ensure_installed

    mason_lspconfig.setup_handlers {
      function (server_name)
        require('lspconfig')[server_name].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        })
      end,
    }
  end
}
