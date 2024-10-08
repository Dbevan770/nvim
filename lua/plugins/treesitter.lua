return {
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
	init = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"dockerfile",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"python",
				"regex",
				"rust",
				"toml",
				"typescript",
				"vue",
				"yaml",
			},
			ignore_install = {},
			modules = {
				"comment",
				"contextual",
				"highlight",
				"indent",
				"incremental_selection",
				"textobjects",
				"move",
				"swap",
			},
			sync_install = false,
			auto_install = false,
			indent = {
				enable = true,
			},
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<c-space>",
					node_incremental = "<c-space>",
					scope_incremental = "<c-s>",
					node_decremental = "<c-backspace>",
				},
			},
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["aa"] = "@parameter.outer",
						["ia"] = "@parameter.inner",
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@class.out",
						["ic"] = "@class.inner",
					},
				},
			},
			move = {
				enable = true,
				set_jumps = true,
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>a"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>A"] = "@parameter.inner",
				},
			},
		})
	end,
}
