local map = function(mode, key, result, options)
	vim.keymap.set(mode, key, result, options or {})
end

-------------------------- Keymaps --------------------------

-------------------- Vim Tmux Navigator ---------------------

------------------------ Normal Mode ------------------------

map("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", {
	silent = true,
	noremap = true,
	desc = "Window left",
})
map("n", "<C-j>", "<CMD>TmuxNavigateDown<CR>", {
	silent = true,
	noremap = true,
	desc = "Window down",
})
map("n", "<C-k>", "<CMD>TmuxNavigateUp<CR>", {
	silent = true,
	noremap = true,
	desc = "Window up",
})
map("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", {
	silent = true,
	noremap = true,
	desc = "Window right",
})

-------------------------- General --------------------------

------------------------ Insert Mode ------------------------

-- Move to beginning or end of line
map("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
map("i", "<C-e>", "<End>", { desc = "End of line" })

-- Navigate within insert mode
map("i", "<C-h>", "<Left>", { desc = "Left" })
map("i", "<C-j>", "<Down>", { desc = "Down" })
map("i", "<C-k>", "<Up>", { desc = "Up" })
map("i", "<C-l>", "<Right>", { desc = "Right" })

------------------------ Normal Mode ------------------------

map("n", "<Esc>", "<CMD>noh<CR>", { desc = "Clear highlights" })

-- Switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Save the file
map("n", "<C-s>", "<CMD>w<CR>", { desc = "Save file" })

-- Copy entire file content
map("n", "<C-c>", "<CMD>%y+<CR>", { desc = "Copy entire file" })

-- Line numbers
map("n", "<leader>tn", "<CMD>set nu!<CR>", { desc = "[T]oggle line [N]umbers" })
map("n", "<leader>trn", "<CMD>set rnu!<CR>", { desc = "[T]oggle [R]elative line [N]umbers" })

-- Append line beneath above cursor and keep cursor in place
map("n", "J", "mzJ`z")

-- Half page jumping, keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Searching keeps cursor centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("n", "<leader>d", '"_d')

-- DON'T EVER PRESS CAPITAL Q
map("n", "Q", "<nop>")

-- Overwrites space so it doesn't interfere with
-- the leader key
map("n", "<Space>", "<nop>", { silent = true })

-- Create a new tmux session
map("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

-- Movement keybinds
map("n", "<C-n>", "<cmd>cnext<CR>zz")
map("n", "<C-p>", "<cmd>cprev<CR>zz")
map("n", "<leader>ln", "<cmd>lnext<CR>zz")
map("n", "<leader>lp", "<cmd>lprev<CR>zz")

-- Remap for dealing with word wrap
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', { desc = "Move up", expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', { desc = "Move down", expr = true })

map("n", "<leader>bn", "<CMD>enew<CR>", { desc = "New buffer" })

map("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, {
	desc = "Manual Lsp [F]omat",
})

-- Diagnostic keymaps
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
map("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

------------------------ Terminal Mode -----------------------

map("t", "<C-x>", function()
	vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
end, {
	desc = "Escape terminal mode",
})

------------------------- Visual Mode ------------------------

-- Move selection up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Yank to system clipboard
map("v", "<leader>y", '"+y')

-- Delete to void register (gets thrown out)
map("v", "<leader>d", '"_d')

map("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {
	desc = "Move up",
	expr = true,
})
map("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {
	desc = "Move down",
	expr = true,
})
map("v", "<", "<gv", { desc = "Indent line" })
map("v", ">", ">gv", { desc = "Indent line" })

-------------------------- Command Mode -----------------------

map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', {
	desc = "Move up",
	expr = true,
})
map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', {
	desc = "Move down",
	expr = true,
})

map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', {
	desc = "Paste over while preserving clipboard",
})

-- Paste over while preserving clipboard
map("x", "<leader>p", '"_dP')

----------------------- Barbar Keymaps ------------------------

------------------------ Normal Mode --------------------------

-- Movement keybinds
map("n", "<S-Tab>", "<CMD>BufferPrevious<CR>", {
	noremap = true,
	silent = true,
	desc = "Previoud buffer",
})
map("n", "<Tab>", "<CMD>BufferNext<CR>", {
	noremap = true,
	silent = true,
	desc = "Next buffer",
})

-- Reorder buffers
map("n", "<A->>", "<CMD>BufferMoveNext<CR>", {
	noremap = true,
	silent = true,
	desc = "Move buffer right",
})
map("n", "<A-<>", "<CMD>BufferMovePrevious<CR>", {
	noremap = true,
	silent = true,
	desc = "Move buffer left",
})

-- Goto buffer in position...
map("n", "<A-1>", "<CMD>BufferGoto 1<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 1",
})
map("n", "<A-2>", "<CMD>BufferGoto 2<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 2",
})
map("n", "<A-3>", "<CMD>BufferGoto 3<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 3",
})
map("n", "<A-4>", "<CMD>BufferGoto 4<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 4",
})
map("n", "<A-5>", "<CMD>BufferGoto 5<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 5",
})
map("n", "<A-6>", "<CMD>BufferGoto 6<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 6",
})
map("n", "<A-7>", "<CMD>BufferGoto 7<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 7",
})
map("n", "<A-8>", "<CMD>BufferGoto 8<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 8",
})
map("n", "<A-9>", "<CMD>BufferGoto 9<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto buffer 9",
})
map("n", "<A-0>", "<CMD>BufferLast<CR>", {
	noremap = true,
	silent = true,
	desc = "Goto last buffer",
})

-- Pin current buffer
map("n", "<A-p>", "<CMD>BufferPin<CR>", {
	noremap = true,
	silent = true,
	desc = "Pin buffer",
})

-- Close Buffer
map("n", "<leader>x", "<CMD>BufferClose<CR>", {
	noremap = true,
	silent = true,
	desc = "Close buffer",
})
-- Restore Buffer
map("n", "<A-s-c>", "<CMD>BufferRestore<CR>", {
	noremap = true,
	silent = true,
	desc = "Restore buffer",
})

-- Magic? buffer picker mode
map("n", "<C-p>", "<CMD>BufferPick<CR>", {
	noremap = true,
	silent = true,
	desc = "Buffer picker",
})
map("n", "<C-p>", "<CMD>BufferPickDelete", {
	noremap = true,
	silent = true,
	desc = "Buffer picker",
})

-- Buffer sorting
map("n", "<leader>bb", "<CMD>BufferOrderByBufferNumber<CR>", {
	noremap = true,
	silent = true,
	desc = "",
})
map("n", "<leader>bd", "<CMD>BufferOrderByDirectory<CR>", {
	noremap = true,
	silent = true,
	desc = "",
})
map("n", "<leader>bl", "<CMD>BufferOrderByLanguage<CR>", {
	noremap = true,
	silent = true,
	desc = "",
})
map("n", "<leader>bw", "<CMD>BufferOrderByWindowNumber<CR>", {
	noremap = true,
	silent = true,
	desc = "",
})

------------------------ Github CLI ---------------------------

------------------------ Normal Mode --------------------------

-- Github CLI mappings
map("n", "<leader>ghrcp", function()
	vim.ui.input({
		prompt = "Enter the name of the repo: ",
	}, function(input)
		vim.cmd(string.format("!gh repo create %s --public", input))
	end)
end, {
	desc = "GitHub repo create (Public)",
})

------------------------ Dotnet CLI --------------------------

------------------------ Normal Mode -------------------------

map("n", "<leader>nr", "<CMD>!dotnet run<CR>", {
	desc = "Dot[N]et [R]un",
})

map("n", "<leader>nb", "<CMD>!dotnet build<CR>", {
	desc = "Dot[N]et [B]uild",
})
