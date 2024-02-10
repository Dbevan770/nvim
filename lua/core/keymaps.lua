vim.g.mapleader = " "

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

-- Create a new tmux session
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Trigger lsp formatting for the current buffer
vim.keymap.set("n", "<leader>f", function ()
    vim.lsp.buf.format()
end)

-- Movement keybinds
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>ln", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>lp", "<cmd>lprev<CR>zz")

-- Change windows
-- Left
vim.keymap.set("n", "<C-h>", "<C-w>h")
-- Up
vim.keymap.set("n", "<C-j>", "<C-w>j")
-- Down
vim.keymap.set("n", "<C-k>", "<C-w>k")
-- Right
vim.keymap.set("n", "<C-l>", "<C-w>l")
