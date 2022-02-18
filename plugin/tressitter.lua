local has_ts, ts = pcall(require, "nvim-treesitter.configs")
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()
require("nvim-treesitter.install").command_extra_args = {
    curl = { "--proxy", "http://127.0.0.1:7890" },
}


parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main"
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main"
    },
}

if not has_ts then return end

ts.setup {
	ensure_installed = {
        "norg",
        "norg_meta",
        "norg_table",
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

