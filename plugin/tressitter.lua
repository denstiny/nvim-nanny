local has_ts, ts = pcall(require, "nvim-treesitter.configs")
if not has_ts then return end

ts.setup {
	ensure_installed = {
		"lua",
		"vim",
		"c",
		"python",
		"java",
		"html",
		"css",
		"javascript",
		"markdown",
		"bash",
		"comment"
	},
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
		use_languagetree = false,
		additional_vim_regex_highlighting = false
	},
	refactor = {
		highlight_definitions = {enable = true},
		highlight_current_scope = {enable = false}
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<cr>",
			scope_incremental = "<nop>",
			node_incremental = "<c-j>",
			node_decremental = "<c-k>"
		}
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",

				["ac"] = "@conditional.outer",
				["ic"] = "@conditional.inner",

				["aa"] = "@parameter.outer",
				["ia"] = "@parameter.inner"
			}
		},
		swap = {
			enable = true,
			swap_next = {["sn"] = "@parameter.inner"},
			swap_previous = {["sp"] = "@parameter.inner"}
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["gf"] = "@function.outer",
				["ga"] = "@parameter.inner"
			},
			goto_previous_start = {
				["gF"] = "@function.outer",
				["gA"] = "@parameter.inner"
			}
		}
	}
}

