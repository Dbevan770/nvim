return {
	"numToStr/Comment.nvim",
	lazy = false,
	keys = {
		{ "tcc", mode = "n", desc = "[T]oggle [C]omment [C]urrent Line" },
		{ "tcl", mode = { "n", "o" }, desc = "[T]oggle [C]omment [L]inewise" },
		{ "tcl", mode = "x", desc = "[T]oggle [C]omment [L]inewise" },
		{ "tcb", mode = "n", desc = "[T]oggle [C]omment Current [B]lock" },
		{ "tcbw", mode = { "n", "o" }, desc = "[T]oggle [C]omment [B]lock[w]ise" },
		{ "tcbw", mode = "x", desc = "[T]oggle [C]omment [B]lock[w]ise" },
	},
	opts = {
		---Add a space b/w comment and the line
		padding = true,
		---Whether the cursor should stay at its position
		sticky = true,
		---Lines to be ignored while (un)comment
		ignore = nil,
		---LHS of toggle mappings in NORMAL mode
		toggler = {
			---Line-comment toggle keymap
			line = "tcc",
			---Block-comment toggle keymap
			block = "tcb",
		},
		---LHS of operator-pending mappings in NORMAL and VISUAL mode
		opleader = {
			-- -Line-comment keymap
			line = "tcc",
			---Block-comment keymap
			block = "tcb",
		},
		---LHS of extra mappings
		extra = {
			---Add comment on the line above
			above = "tcO",
			---Add comment on the line below
			below = "tco",
			---Add comment at the end of line
			eol = "tcA",
		},
		---Enable keybindings
		---NOTE: If given `false` then the plugin won't create any mappings
		mappings = {
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
		---Function to call before (un)comment
		pre_hook = nil,
		---Function to call after (un)comment
		post_hook = nil,
	},
}
