local plugins = {
  {
    "nvim-lua/plenary.nvim",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      require("core.utils").load_mappings("barbar")
    end,
    opts = function()
      return require("custom.configs.barbar")
    end,
    config = function(_, opts)
      require("barbar").setup(opts)
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function(_, opts)
      require("ibl").setup(opts)
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = function()
      return require("custom.configs.catppuccin")
    end,
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd("colorscheme catppuccin")
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      { "saadparwaiz1/cmp_luasnip" },
      { "neovim/nvim-lspconfig" },
      { "hrsh7th/cmp-nvim-lua" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-cmdline" },
    },
    opts = function()
      return require("custom.configs.cmp")
    end,
    config = function(_, opts)
      require("cmp").setup(opts)
    end,
  },
  {
    "numToStr/Comment.nvim",
    lazy = false,
    keys = {
      { "tcc",  mode = "n",          desc = "[T]oggle [C]omment [C]urrent Line" },
      { "tcl",  mode = { "n", "o" }, desc = "[T]oggle [C]omment [L]inewise" },
      { "tcl",  mode = "x",          desc = "[T]oggle [C]omment [L]inewise" },
      { "tcb",  mode = "n",          desc = "[T]oggle [C]omment Current [B]lock" },
      { "tcbw", mode = { "n", "o" }, desc = "[T]oggle [C]omment [B]lock[w]ise" },
      { "tcbw", mode = "x",          desc = "[T]oggle [C]omment [B]lock[w]ise" },
    },
    opts = function()
      return require("custom.configs.comment")
    end,
  },
  {
    "github/copilot.vim",
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    event = { "BufRead Cargo.toml" },
    config = function(_, opts)
      require("crates").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("core.utils").load_mappings("dap")
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = { "python" },
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path, opts or {})
    end,
  },
  {
    "tpope/vim-fugitive",
    init = function()
      require("core.utils").load_mappings("fugitive")
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require("custom.configs.gitsigns")
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },
  {
    "olexsmir/gopher.nvim",
    ft = "go",
    init = function()
      require("core.utils").load_mappings("gopher")
    end,
    config = function(_, opts)
      require("gopher").setup(opts)
    end,
    build = function()
      vim.cmd([[silent! GoInstallDeps]])
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    init = function()
      require("core.utils").load_mappings("harpoon")
    end,
    config = function()
      require("harpoon"):setup({})
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "williamboman/mason.nvim",
      { "j-hui/fidget.nvim", opts = {} },
      "folke/neodev.nvim",
    },
  },
  {
    "onsails/lspkind.nvim",
    opts = {},
    config = function(_, opts)
      require("lspkind").init(opts)
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      return require("custom.configs.lualine")
    end,
    config = function(_, opts)
      require("lualine").setup(opts)
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    opts = function()
      return require("custom.configs.luasnip")
    end,
    config = function(_, opts)
      require("luasnip").setup(opts)
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function()
      return require("custom.configs.mason")
    end,
    config = function(_, opts)
      require("mason").setup(opts)
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "folke/neodev.nvim",
    },
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    opts = function()
      return require("custom.configs.mason-lspconfig")
    end,
    config = function()
      local mason_lspconfig = require("mason-lspconfig")
      local custom_config = require("custom.configs.mason-lspconfig")

      custom_config.opts.ensure_installed = vim.tbl_keys(custom_config.servers)
      mason_lspconfig.setup(custom_config.opts)

      mason_lspconfig.setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = custom_config.capabilities,
            on_attach = custom_config.on_attach,
            settings = custom_config.servers[server_name],
            filetypes = (custom_config.servers[server_name] or {}).filetypes,
          })
        end,
      })
    end,
  },
  {
    "folke/neodev.nvim",
    opts = {},
  },
  {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      return require("custom.configs.null-ls")
    end,
    config = function(_, opts)
      require("null-ls").setup(opts)
    end,
  },
  {
    "hedyhli/outline.nvim",
    cmd = { "Outline", "OutlineOpen" },
    keys = {
      { "<leader>to", "<cmd>Outline<CR>", desc = "[T]oggle [O]utline" },
    },
    opts = {},
    config = function(_, opts)
      require("outline").setup(opts)
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    cmd = {
      "NvimTreeToggle",
      "NvimTreeFocus",
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    init = function()
      require("core.utils").load_mappings("nvim_tree")
    end,
    opts = function()
      return require("custom.configs.nvim-tree")
    end,
    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      return require("custom.configs.nvim-web-devicons")
    end,
    config = function(_, opts)
      require("nvim-web-devicons").setup(opts)
    end,
  },
  {
    "tpope/vim-rhubarb",
  },
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    init = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = require("mason-lspconfig").on_attach
      vim.g.rustaceanvim = {
        server = {
          capabilities = capabilities,
          on_attach = on_attach,
        },
        cargo = {
          allFeatures = true,
        },
      }
    end,
  },
  {
    "tpope/vim-sleuth",
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
    },
    cmd = {
      "Telescope",
    },
    init = function()
      require("core.utils").load_mappings("telescope")
    end,
    opts = function()
      return require("custom.configs.telescope")
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
      telescope.load_extension("ui-select")
      telescope.load_extension("luasnip")
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
  {
    "benfowler/telescope-luasnip.nvim",
  },
  {
    "nvim-treesitter/nvim-treesitter",
    event = {
      "BufReadPost",
      "BufNewFile",
    },
    cmd = {
      "TSInstall",
      "TSBufEnable",
      "TSBufDisable",
      "TSModuleInfo",
    },
    build = ":TSUpdate",
    opts = function()
      return require("custom.configs.treesitter")
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "mbbill/undotree",
    init = function()
      require("core.utils").load_mappings("undotree")
    end,
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      "<leader>",
      "<c-r>",
      "<c-w>",
      '"',
      "'",
      "`",
      "c",
      "v",
      "g",
    },
    cmd = "WhichKey",
    config = function(_, opts)
      local which_key = require("which-key")
      which_key.setup(opts)

      which_key.register({
        ["<leader>b"] = { name = "[B]uffers", _ = "which_key_ignore" },
        ["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
        ["<leader>d"] = { name = "[D]ebug", _ = "which_key_ignore" },
        ["<leader>f"] = { name = "[F]ormat", _ = "which_key_ignore" },
        ["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
        ["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
        ["<leader>l"] = { name = "[L]SP", _ = "which_key_ignore" },
        ["<leader>n"] = { name = "Dot[N]et", _ = "which_key_ignore" },
        ["<leader>r"] = { name = "[R]ust", _ = "which_key_ignore" },
        ["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
        ["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
        ["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
      })

      which_key.register({
        ["<leader>"] = { name = "VISUAL <leader>" },
        ["<leader>h"] = { "Git [H]unk" },
      }, { mode = "v" })
    end,
  },
}

return plugins
