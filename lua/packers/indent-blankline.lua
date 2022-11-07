--vim.opt.list = true
--vim.opt.listchars:append("space:⋅")
--vim.opt.listchars:append("eol:⏎")
--vim.opt.listchars:append("nbsp:⎵")
local has_ts, indent_blankline = pcall(require, "indent_blankline")
if not has_ts then return end

indent_blankline.setup {
  --char = "▏",
  space_char_blankline = " ",
  show_current_context = false,
  show_current_context_start = false,
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

vim.g.indent_blankline_filetype_exclude = { 'help', 'startify', 'TERMINAL', 'terminal', 'packer', 'lsp-installer', '',
  'startuptime', 'toggleterm', 'translator', 'markdown', 'norg' }
vim.g.indent_blankline_show_end_of_line = false -- 占用隐藏符号
vim.g.indent_blankline_show_trailing_blankline_indent = false -- 删除多余的缩进线
