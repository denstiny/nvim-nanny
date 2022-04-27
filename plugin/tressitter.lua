local has_ts, ts = pcall(require, "nvim-treesitter.configs")
if not has_ts then return end
local parser_configs = require('nvim-treesitter.parsers').get_parser_configs()



-- use ssh to download parser
-- require("nvim-treesitter.install").prefer_git = true
-- local parsers = require("nvim-treesitter.parsers").get_parser_configs()
-- for _, p in pairs(parsers) do
-- 	p.install_info.url = p.install_info.url:gsub("https://github.com/", "git@github.com:")
-- end

parser_configs.norg = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg",
        files = { "src/parser.c", "src/scanner.cc" },
        branch = "main"
    },
}

parser_configs.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = { 'src/parser.c', 'src/scanner.cc' },
  },
  filetype = 'org',
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


ts.setup {
  ensure_installed = {
    "norg",
    "norg_meta",
    "norg_table",
    "lua",
    "vim",
    "c",
    "cpp",
    --"org",
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

