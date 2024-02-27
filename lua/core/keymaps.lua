local builtin = require("telescope.builtin")
local diagnostic = vim.diagnostic
local bufnr = vim.api.nvim_get_current_buf()

-- Custom keymap function
local map = function(mode, key, result, desc, options)
	-- Set default options
	local default_options = { noremap = true, silent = true, desc = desc }
	options = default_options and options or default_options

	-- Set the keymap
	vim.keymap.set(mode, key, result, options)
end

-- Custom Telescope keymap
local function telescope_live_grep_open_files()
	builtin.live_grep({
		grep_open_files = true,
		prompt_title = "Live Grep in Open Files",
	})
end

-------------------------- Keymaps --------------------------

-------------------- Vim Tmux Navigator ---------------------

------------------------ Normal Mode ------------------------

map("n", "<C-h>", "<CMD>TmuxNavigateLeft<CR>", "Window left")
map("n", "<C-k>", "<CMD>TmuxNavigateDown<CR>", "Window down")
map("n", "<C-j>", "<CMD>TmuxNavigateUp<CR>", "Window up")
map("n", "<C-l>", "<CMD>TmuxNavigateRight<CR>", "Window right")

-------------------------- General --------------------------

------------------------ Insert Mode ------------------------

-- Move to beginning or end of line
map("i", "<C-b>", "<ESC>^i", "Beginning of line")
map("i", "<C-e>", "<End>", "End of line")

-- Navigate within insert mode
map("i", "<C-h>", "<Left>", "Left")
map("i", "<C-k>", "<Down>", "Down")
map("i", "<C-j>", "<Up>", "Up")
map("i", "<C-l>", "<Right>", "Right")

------------------------ Normal Mode ------------------------

map("n", "<Esc>", "<CMD>noh<CR>", "Clear highlights")

-- Switch between windows
map("n", "<C-h>", "<C-w>h", "Window left")
map("n", "<C-k>", "<C-w>j", "Window down")
map("n", "<C-j>", "<C-w>k", "Window up")
map("n", "<C-l>", "<C-w>l", "Window right")

-- Save the file
map("n", "<C-s>", "<CMD>w<CR>", "Save file")

-- Copy entire file content
map("n", "<C-c>", "<CMD>%y+<CR>", "Copy entire file")

-- Line numbers
map("n", "<leader>tn", "<CMD>set nu!<CR>", "[T]oggle line [N]umbers")
map("n", "<leader>trn", "<CMD>set rnu!<CR>", "[T]oggle [R]elative line [N]umbers")

-- Append line beneath above cursor and keep cursor in place
map("n", "J", "mzJ`z")

-- Bind U to redo
map("n", "U", "<C-r>", "Redo")

-- Scrolling
map("n", ",", "<C-u>", "Scroll up half page")
map("n", "m", "<C-d>", "Scroll down half page")
map("n", "M", "m", "Scroll to middle of page")

-- Insert empty line above or below without entering insert mode
map("n", "<leader>o", ':<C-u>call append(line("."),repeat([""],v:count1))<CR>', "Insert empty line below")
map("n", "<leader>O", ':<C-u>call append(line(".")-1,repeat([""],v:count1))<CR>', "Insert empty line above")

map("n", "H", "_", "Move to first non-blank character of the line")
map("n", "L", "$", "Move to end of line")

-- Half page jumping, keep cursor centered
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Searching keeps cursor centered
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- DON'T EVER PRESS CAPITAL Q
map("n", "Q", "<nop>")

-- Overwrites space so it doesn't interfere with
-- the leader key
map("n", "<Space>", "<nop>")

-- Create a new tmux session
map("n", "<C-f>", "<cmd>silent !tmux new tmux-sessionizer<CR>")

-- Movement keybinds
map("n", "<C-n>", "<cmd>cnext<CR>zz")
map("n", "<C-p>", "<cmd>cprev<CR>zz")
map("n", "<leader>ln", "<cmd>lnext<CR>zz")
map("n", "<leader>lp", "<cmd>lprev<CR>zz")

-- Remap for dealing with word wrap
map("n", "j", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", { expr = true })
map("n", "k", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", { expr = true })
map("n", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gk"', "Move up", { expr = true })
map("n", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gj"', "Move down", { expr = true })

map("n", "<leader>bn", "<CMD>enew<CR>", "New buffer")

map("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, "Manual Lsp [F]omat")

-- Diagnostic keymaps
map("n", "[d", diagnostic.goto_prev, "Go to previous diagnostic message")
map("n", "]d", diagnostic.goto_next, "Go to next diagnostic message")
map("n", "<leader>e", diagnostic.open_float, "Open floating diagnostic message")
map("n", "<leader>q", diagnostic.setloclist, "Open diagnostics list")

------------------------ Terminal Mode -----------------------

map("t", "<C-x>", function()
	vim.api.nvim_replace_termcodes("<C-\\><C-n>", true, true, true)
end, "Escape terminal mode")

------------------------- Visual Mode ------------------------

-- Move selection up or down
map("v", "K", ":m '>+1<CR>gv=gv") -- DOWN
map("v", "J", ":m '<-2<CR>gv=gv") -- UP

-- Yank to system clipboard
map("v", "<leader>y", '"+y')

-- Delete to void register (gets thrown out)
map("v", "<leader>d", '"_d')

map("v", "<Up>", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", {
	expr = true,
})
map("v", "<Down>", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", {
	expr = true,
})
map("v", "<", "<gv", "Indent line")
map("v", ">", ">gv", "Indent line")

-------------------------- Command Mode -----------------------

map("x", "j", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"', "Move up", {
	expr = true,
})
map("x", "k", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"', "Move down", {
	expr = true,
})

map("x", "p", 'p:let @+=@0<CR>:let @"=@0<CR>', "Paste over while preserving clipboard")

-- Paste over while preserving clipboard
map("x", "<leader>p", '"_dP')

----------------------- Barbar Keymaps ------------------------

------------------------ Normal Mode --------------------------

-- Movement keybinds
map("n", "<S-Tab>", "<CMD>BufferPrevious<CR>", "Previous buffer")

map("n", "<Tab>", "<CMD>BufferNext<CR>", "Next buffer")

-- Reorder buffers
map("n", "<A->>", "<CMD>BufferMoveNext<CR>", "Move buffer right")

map("n", "<A-<>", "<CMD>BufferMovePrevious<CR>", "Move buffer left")

-- Goto buffer in position...
map("n", "<A-1>", "<CMD>BufferGoto 1<CR>", "Goto buffer 1")
map("n", "<A-2>", "<CMD>BufferGoto 2<CR>", "Goto buffer 2")

map("n", "<A-3>", "<CMD>BufferGoto 3<CR>", "Goto buffer 3")

map("n", "<A-4>", "<CMD>BufferGoto 4<CR>", "Goto buffer 4")
map("n", "<A-5>", "<CMD>BufferGoto 5<CR>", "Goto buffer 5")

map("n", "<A-6>", "<CMD>BufferGoto 6<CR>", "Goto buffer 6")

map("n", "<A-7>", "<CMD>BufferGoto 7<CR>", "Goto buffer 7")

map("n", "<A-8>", "<CMD>BufferGoto 8<CR>", "Goto buffer 8")

map("n", "<A-9>", "<CMD>BufferGoto 9<CR>", "Goto buffer 9")

map("n", "<A-0>", "<CMD>BufferLast<CR>", "Goto last buffer")

-- Pin current buffer
map("n", "<A-p>", "<CMD>BufferPin<CR>", "Pin buffer")

-- Close Buffer
map("n", "<leader>x", "<CMD>BufferClose<CR>", "Close buffer")

-- Restore Buffer
map("n", "<A-s-c>", "<CMD>BufferRestore<CR>", "Restore buffer")

-- Magic? buffer picker mode
map("n", "<C-p>", "<CMD>BufferPick<CR>", "Buffer picker")

map("n", "<C-p>", "<CMD>BufferPickDelete", "Buffer picker")

-- Buffer sorting
map("n", "<leader>bb", "<CMD>BufferOrderByBufferNumber<CR>", "")
map("n", "<leader>bd", "<CMD>BufferOrderByDirectory<CR>", "")
map("n", "<leader>bl", "<CMD>BufferOrderByLanguage<CR>", "")

map("n", "<leader>bw", "<CMD>BufferOrderByWindowNumber<CR>", "")

---------------------- Nvim-Tree Keymaps ----------------------

------------------------ Normal Mode --------------------------

-- Toggle Nvim-Tree Window
map("n", "<leader>tt", "<cmd>NvimTreeToggle<CR>", "[T]oggle Nvim-[T]ree window")

---------------------- Telescope Keymaps ----------------------

------------------------ Normal Mode --------------------------
local extensions = require("telescope").extensions

map("n", "<leader>/", function()
	-- You can pass additional configuration to telescope to change theme, layout, etc.
	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		winblend = 0,
		previewer = false,
	}))
end, "[/] Fuzzily search in current buffer")

map("n", "<leader><space>", builtin.buffers, "[ ] Find existing buffers")

map("n", "<leader>ss", builtin.builtin, "[S]earch [S]election telescope")

map("n", "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics")

map("n", "<leader>se", function()
	extensions.lazygit.lazygit()
end, "[S]earch Lazygit [E]xtension")

map("n", "<leader>sf", builtin.find_files, "[S]earch [F]iles")

map("n", "<leader>gf", builtin.git_files, "Search in [G]it [F]iles")

map("n", "<leader>sw", builtin.grep_string, "[S]earch current [W]ord")

map("n", "<leader>sh", builtin.help_tags, "[S]earch [H]elp")

map("n", "<leader>sc", builtin.highlights, "[S]earch [C]olors (highlight groups)")

map("n", "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps")

map("n", "<leader>s/", telescope_live_grep_open_files, "[S]earch [/] in Open Files")

map("n", "<leader>sg", builtin.live_grep, "[S]earch by [G]rep")

map("n", "<leader>?", builtin.oldfiles, "[?] Find recently opened files")

map("n", "<leader>sr", builtin.resume, "[S]earch [R]esume")

------------------------ Github CLI ---------------------------

------------------------ Normal Mode --------------------------

-- Github CLI mappings
map("n", "<leader>ghrcp", function()
	vim.ui.input({
		prompt = "Enter the name of the repo: ",
	}, function(input)
		vim.cmd(string.format("!gh repo create %s --public", input))
	end)
end, "GitHub repo create (Public)")

------------------------ Dotnet CLI --------------------------

------------------------ Normal Mode -------------------------

map("n", "<leader>nr", "<CMD>!dotnet run<CR>", "Dot[N]et [R]un")

map("n", "<leader>nb", "<CMD>!dotnet build<CR>", "Dot[N]et [B]uild")

---------------------- Lazygit Keymaps -----------------------

------------------------ Normal Mode -------------------------

map("n", "<leader>gg", "<CMD>LazyGit<CR>", "[G]it [G]ui")

------------------------ Rust Keymaps ------------------------

------------------------ Normal Mode -------------------------

map("n", "<leader>a", function()
	vim.cmd.RustLsp("codeAction")
end, {
	silent = true,
	buffer = bufnr,
	desc = "Code [A]ction",
})

map("n", "<leader>ree", function()
	vim.cmd.RustLsp("explainError")
end, {
	silent = true,
	buffer = bufnr,
	desx = "[R]ust [E]xplain [E]rror",
})

map("n", "<leader>rrd", function()
	vim.cmd.RustLsp("renderDiagnostic")
end, {
	silent = true,
	buffer = bufnr,
	desc = "[R]ust [R]ender [D]iagnostics",
})

map("n", "<leader>roc", function()
	vim.cmd.RustLsp("openCargo")
end, {
	silent = true,
	buffer = bufnr,
	desc = "[R]ust [O]pen [C]argo",
})

map("n", "<leader>rjl", function()
	vim.cmd.RustLsp("joinLines")
end, {
	silent = true,
	buffer = bufnr,
	desc = "[R]ust [J]oin [L]ines",
})

map("n", "<leader>rcr", "<CMD>!cargo run<CR>", "[R]ust [C]argo [R]un")

map("n", "<leader>rcb", "<CMD>!cargo build<CR>", "[R]ust [C]argo [B]uild")

map("n", "<leader>rcd", "<CMD>!cargo doc<CR>", "[R]ust [C]argo [D]oc")

map("n", "<leader>rct", "<CMD>!cargo test<CR>", "[R]ust [C]argo [T]est")
