--vim.g.autoformat_autoindent = 0
--vim.g.autoformat_retab = 0
--vim.g.autoformat_remove_trailing_spaces = 0
--vim.cmd([[
--let g:formatdef_astyle = '"astyle --indent=spaces=4 --max-code-length=80 -xW -A2 -xp -o -C -xt -L -M -w -Y -M -xd -k1 -p -E -O -S"'
--let g:formatdef_astyle_java = '"astyle --align-pointer=middle --delete-empty-lines --pad-oper --indent=tab "'
--let g:formatdef_rustfmt = '"rustfmt --emit=stdout"'
--let g:formatdef_luaformat = "'stylua --search-parent-directories --stdin-filepath ' . expand('%:p') .' -- -'"
--
--let g:formatters_c = ['astyle']
--let g:formatters_cpp = ["astyle"]
--let g:formatters_java = ["astyle_java"]
--let g:formatters_rust = ["rustfmt"]
--let g:formatters_lua = ["luaformat"]
--]])
local conform = require("conform")

conform.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		c = { "astyle" },
		cpp = { "astyle" },
		python = { "yapf" },
	},

	format_on_save = {
		-- I recommend these options. See :help conform.format for details.
		lsp_fallback = true,
		timeout_ms = 500,
		quiet = true,
	},

	formatters = {
		yapf = {
			args = {
				"--style=pep8",
			},
		},
		astyle = {
			args = {
				"--indent=spaces=2",
				"--max-code-length=80",
				"-xW",
				"-A2",
				"-xp",
				"-o",
				"-C",
				"-xt",
				"-L",
				"-M",
				"-w",
				"-Y",
				"-M",
				"-xd",
				"-k1",
				"-p",
				"-E",
				"-O",
				"-S",
			},
		},
	},
})
