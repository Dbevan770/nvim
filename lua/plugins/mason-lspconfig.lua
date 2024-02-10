return {
  'williamboman/mason-lspconfig.nvim',
  dependencies = {
    'williamboman/mason.nvim'
  },
  cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUpdate' },
  opts = {
    ensure_installed = {
      'bashls',
      'clangd',
      'csharp_ls',
      'cssls',
      'dockerls',
      'docker_compose_language_service',
      'eslint',
      'gopls',
      'gradle_ls',
      'html',
      'jsonls',
      'java_language_server',
      'lua_ls',
      'marksman',
      'pyright',
      'rust_analyzer',
      'sqls',
      'tailwindcss',
      'tsserver',
      'yamlls',
    },
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
    require('mason-lspconfig').setup(opts)

    vim.api.nvim_create_user_command("MasonInstallAll", function ()
      if opts.ensure_installed and #opts.ensure_installed > 0 then
        vim.cmd('MasonInstall ' .. table.concat(opts.ensure_installed, ' '))
      end
    end, {})

    vim.g.mason_binaries_list = opts.ensure_installed
  end
}
