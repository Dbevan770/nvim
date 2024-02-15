local M = {}

M.barbar = {
  plugin = true,
  n = {
    ["<S-Tab>"] = { "<CMD>BufferPrevious<CR>", "Previous Buffer" },
    ["<Tab>"] = { "<CMD>BufferNext<CR>", "Next Buffer" },
    ["<A-p>"] = { "<CMD>BufferPin<CR>", "Pin Buffer" },
    ["<A-c>"] = { "<CMD>BufferClose<CR>", "Close Buffer" },
    ["<A-s-c>"] = { "<CMD>BufferRestore<CR>", "Restore Buffer" },
    ["<C-p>"] = { "<CMD>BufferPick<CR>", "Buffer Picker" },
    ["<leader>bb"] = { "<CMD>BufferOrderByBufferNumber<CR>", "Order by Buffer Number" },
    ["<leader>bd"] = { "<CMD>BufferOrderByDirectory<CR>", "Order by Directory" },
    ["<leader>bl"] = { "<CMD>BufferOrderByLanguage<CR>", "Order by Language" },
    ["<leader>bw"] = { "<CMD>BufferOrderByWindowNumber<CR>", "Order by Window Number" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<CMD>DapToggleBreakpoint<CR>", "[D]ap Toggle [B]reakpoint" },
    ["<leader>dc"] = { "<CMD>DapContinue<CR>", "[D]ap [C]ontinue" },
    ["<leader>dd"] = { "<CMD>DapToggle<CR>", "[D]ap [D]ebug" },
    ["<leader>dso"] = { "<CMD>DapStepOver<CR>", "[D]ap [S]tep [O]ver" },
    ["<leader>dsi"] = { "<CMD>DapStepInto<CR>", "[D]ap [S]tep [I]nto" },
    ["<leader>dsu"] = { "<CMD>DapStepOut<CR>", "[D]ap [S]tep O[u]t" },
    ["<leader>dl"] = { "<CMD>DapLogPoint<CR>", "[D]ap [L]og [P]oint" },
    ["<leader>dr"] = { "<CMD>DapReplOpen<CR>", "[D]ap [R]epl [O]pen" },
    ["<leader>dt"] = { "<CMD>DapToggleRepl<CR>", "[D]ap [T]oggle [R]epl" },
    ["<leader>du"] = { "<CMD>DapUIOpen<CR>", "[D]ap [U]I [O]pen" },
    ["<leader>tds"] = {
      function()
        local widgets = require("dap.ui.widgets")
        local sidebar = widgets.sidebar(widgets.scopes)
        sidebar.toggle()
      end,
      "[T]oggle [D]ap [S]idebar",
    },
  },
}

M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "[D]ebug [G]o [T]est",
    },
    ["<leader>dgl"] = {
      function()
        require("dap-go").debug_last()
      end,
      "[D]ebug [G]o [L]ast",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "[D]ebug [P]ython [R]un",
    },
  },
}

M.fugitive = {
  plugin = true,
  n = {
    ["<leader>gs"] = { "<CMD>Git<CR>", "[G]it [S]tatus" },
    ["<leader>gd"] = { "<CMD>Git difftool<CR>", "[G]it [D]iff" },
    ["<leader>gm"] = { "<CMD>Git mergetool<CR>", "[G]it [M]erge" },
    ["<leader>gF"] = { "<CMD>Git fetch<CR>", "[G]it [F]etch" },
    ["<leader>gc"] = { "<CMD>Git commit<CR>", "[G]it [C]ommit" },
    ["<leader>gb"] = { "<CMD>Git blame<CR>", "[G]it [B]lame" },
    ["<leader>gl"] = { "<CMD>Git log --oneline<CR>", "[G]it [L]og" },
    ["<leader>gp"] = { "<CMD>Git push<CR>", "[G]it [P]ush" },
    ["<leader>gP"] = { "<CMD>Git pull<CR>", "[G]it [P]ull" },
    ["<leader>gA"] = { "<CMD>Gwrite<CR>", "[G]it [A]dd current buffer" },
    ["<leader>gaq"] = { "<CMD>Gwq<CR>", "[G]it [A]dd and close buffer" },
    ["<leader>gaQ"] = { "<CMD>Gwq!<CR>", "Force [G]it [A]dd and close buffer" },
    ["<leader>gD"] = { "<CMD>GDelete<CR>", "[G]it remove file and [D]elete buffer" },
    ["<leader>gdD"] = { "<CMD>GDelete!<CR>", "Git rm file and pass -f force flag" },
    ["<leader>gR"] = { "<CMD>GRemove<CR>", "Git rm but keep buffer (now empty)" },
  },
}

M.gopher = {
  plugin = true,
  n = {
    ["<leader>gsj"] = { "<CMD>GoTagAdd json<CR>", "[G]o add [S]truct [J]son tags" },
    ["<leader>gsy"] = { "<CMD>GoTagAdd yaml<CR>", "[G]o add [S]truct [Y]aml tags" },
    ["<leader>gmt"] = { "<CMD>GoModTidy<CR>", "[G]o [M]odule [T]idy" },
    ["<leader>gta"] = { "<CMD>GoTestsAll<CR>", "[G]o [T]ests [A]ll" },
    ["<leader>gie"] = { "<CMD>GoIfErr<CR>", "[G]o [I]f [E]rror" },
  },
}

M.harpoon = {
  plugin = true,
  n = {
    ["<C-e>"] = {
      function()
        local conf = require("telescope.config").values
        local function toggle_telescope(harpoon_files)
          local file_paths = {}
          for _, item in ipairs(harpoon_files.items) do
            table.insert(file_paths, item.value)
          end

          require("telescope.pickers")
              .new({}, {
                prompt_title = "Harpoon",
                finder = require("telescope.finders").new_table({
                  results = file_paths,
                }),
                previewer = conf.file_previewer({}),
                sorter = conf.generic_sorter({}),
              })
              :find()
        end

        toggle_telescope(require("harpoon"):list())
      end,
      "Open harpoon window",
    },
    ["<M-h>"] = {
      function()
        require("harpoon"):list():select(1)
      end,
      "Select first harpoon window",
    },
    ["<M-j>"] = {
      function()
        require("harpoon"):list():select(2)
      end,
      "Select second harpoon window",
    },
    ["<M-k>"] = {
      function()
        require("harpoon"):list():select(3)
      end,
      "Select third harpoon window",
    },
    ["<M-l>"] = {
      function()
        require("harpoon"):list():select(4)
      end,
      "Select fourth harpoon window",
    },
    ["<C-S-P>"] = {
      function()
        require("harpoon"):list():prev()
      end,
      "Select previous buffer in harpoon",
    },
    ["<C-S-N>"] = {
      function()
        require("harpoon"):list():next()
      end,
      "Select next buffer in harpoon",
    },
  },
}

M.nvim_tree = {
  plugin = true,
  n = {
    ["<C-n>"] = { "<CMD>NvimTreeToggle<CR>", "[N]vim [T]ree [T]oggle" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>?"] = { "<CMD>Telescope oldfiles<CR>", "[?] Find recently opened files" },
    ["<leader><space>"] = { "<CMD>Telescope buffers<CR>", "[ ] Find existing buffers" },
    ["<leader>/"] = {
      function()
        require("telescope.builtin").current_buffer_fuzzy_find(
          require("telescope.themes").get_dropdown({ winblend = 10, previewer = false })
        )
      end,
      "[/] Fuzzily search in current buffer",
    },
    ["<leader>s/"] = {
      function()
        require("telescope.builtin").live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files",
        })
      end,
      "[S]earch [/] in Open Files",
    },
    ["<leader>gf"] = { "<CMD>Telescope git_files<CR>", "Search in [G]it [F]iles" },
    ["<leader>sf"] = { "<CMD>Telescope find_files<CR>", "[S]earch [F]iles" },
    ["<leader>sh"] = { "<CMD>Telescope help_tags<CR>", "[S]earch [H]elp" },
    ["<leader>sw"] = { "<CMD>Telescope grep_string<CR>", "[S]earch current [W]ord" },
    ["<leader>sg"] = { "<CMD>Telescope live_grep<CR>", "[S]earch by [G]rep" },
    ["<leader>sd"] = { "<CMD>Telescope diagnostics<CR>", "[S]earch [D]iagnostics" },
    ["<leader>sr"] = { "<CMD>Telescope resume<CR>", "[S]earch [R]esume" },
    ["<leader>ss"] = { "<CMD>Telescope luasnip<CR>", "[S]earch [S]nippets" },
  },
}

M.undotree = {
  plugin = true,
  n = {
    ["<leader>tu"] = { "<CMD>UndotreeToggle<CR>", "[U]ndo [T]ree [T]oggle" },
  },
}

return M
