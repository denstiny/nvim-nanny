vim.g.indent_blankline_show_current_context = true
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', '^if', '^while', '^for', '^object', '^table', 'block', 'arguments','typedef'}
vim.g.indent_blankline_char = '│'
-- 设置特定缓冲区不起用
vim.g.indent_blankline_filetype_exclude = {'help','startify','nerdtree'}
