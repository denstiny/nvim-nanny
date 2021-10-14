vim.g.indent_blankline_show_current_context = true
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
vim.g.indent_blankline_char = '│'
-- 设置特定缓冲区不起用
vim.g.indent_blankline_filetype_exclude = {'help','startify'}



------ specs plugins --------------------------------
require('specs').setup{ 
    show_jumps  = true,
    min_jump = 30,
    popup = {
        delay_ms = 0, -- delay before popup displays
        inc_ms = 15, -- time increments used for fade/resize effects 
        blend = 100, -- starting blend, between 0-100 (fully transparent), see :h winblend
        width = 30,
        winhl = "PMenu",
        fader = require('specs').linear_fader,
        resizer = require('specs').shrink_resizer
    },
    ignore_filetypes = {},
    ignore_buftypes = {
        nofile = true,
    },
}
