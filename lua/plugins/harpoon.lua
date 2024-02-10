return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function ()
    local harpoon = require('harpoon')
    harpoon:setup({})

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
        prompt_title = "Harpoon",
        finder = require("telescope.finders").new_table({
          results = file_paths,
        }),
        previewer = conf.file_previewer({}),
        sorter = conf.generic_sorter({}),
      }):find()
    end

    vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })
    vim.keymap.set("n", "<M-h>", function() harpoon:list():select(1) end,
      { desc = "Select first harpoon window" })
    vim.keymap.set("n", "<M-j>", function() harpoon:list():select(2) end,
      { desc = "Select second harpoon window" })
    vim.keymap.set("n", "<M-k>", function() harpoon:list():select(3) end,
      { desc = "Select third harpoon window" })
    vim.keymap.set("n", "<M-l>", function() harpoon:list():select(4) end,
      { desc = "Select fourth harpoon window" })

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end,
      { desc = "Select previous buffer in harpoon" })
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end,
      { desc = "Select next buffer in harpoon" })
  end
}
