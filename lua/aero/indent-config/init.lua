vim.opt.list = true
--vim.opt.listchars:append("space: ")
--vim.opt.listchars:append("eol:⏎")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

vim.g.indent_blankline_context_patterns = {
	'class',
	'function',
	'method',
	'^if',
	'^while',
	'^typedef',
	'^for',
	'^object',
	'^table',
	'block',
	'arguments',
	'typedef',
	'while',
	'^public',
	'return',
	'if_statement',
	'else_clause',
	'jsx_element',
	'jsx_self_closing_element',
	'try_statement',
	'catch_clause',
	'import_statement'
}

vim.g.indent_blankline_filetype_exclude = {'help','startify','TERMINAL','terminal','packer','lsp-installer','','startuptime'}
