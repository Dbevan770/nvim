vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Move selection up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append line beneath above cursor and keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

-- Half page jumping, keep cursor centered
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Searching keeps cursor centered
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste over while preserving clipboard
vim.keymap.set("x", "<leader>p", "\"_dP")

-- Yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Delete to void register (gets thrown out)
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- DON'T EVER PRESS CAPITAL Q
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set('n', '<Space>', '<nop>', { silent = true })

-- Create a new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

-- Movement keybinds
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>ln", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>lp", "<cmd>lprev<CR>zz")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Change windows
-- Left
vim.keymap.set("n", "<C-h>", "<C-w>h")
-- Up
vim.keymap.set("n", "<C-j>", "<C-w>j")
-- Down
vim.keymap.set("n", "<C-k>", "<C-w>k")
-- Right
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Github CLI mappings
vim.keymap.set('n', '<leader>ghrcp', function()
  vim.ui.input({
    prompt = 'Enter the name of the repo: '
  },
    function(input)
      vim.cmd(string.format("!gh repo create %s --public", input))
    end)
end, {
    desc = 'GitHub repo create (Public)'
  })

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- Dotnet mappings
vim.keymap.set('n', '<leader>nr', '<CMD>!dotnet run<CR>', {
  desc = 'Dot[N]et [R]un'
})

vim.keymap.set('n', '<leader>nb', '<CMD>!dotnet build<CR>', {
  desc = 'Dot[N]et [B]uild'
})

--Modify Copilot mappings
vim.keymap.set('i', '<C-J>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

