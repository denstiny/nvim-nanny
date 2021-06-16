vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {
	'class',
	'function',
	'method',
	'^if',
	'^while',
	'^for',
	'^object',
	'^table',
	'block',
	'arguments',
	'typedef',
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
vim.g.indent_blankline_char = '│'
-- 设置特定缓冲区不起用
vim.g.indent_blankline_filetype_exclude = {'help','startify','nerdtree'}

