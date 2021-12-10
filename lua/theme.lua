vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("tab:⋅⋅")
--vim.opt.listchars:append("eol:\ ")

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
        "IndentBlanklineIndent5",
        "IndentBlanklineIndent6",
    },
}vim.g.indent_blankline_show_current_context = true
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
--vim.g.indent_blankline_char = '│'
-- 设置特定缓冲区不起用
vim.g.indent_blankline_filetype_exclude = {'help','startify'}

