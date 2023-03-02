vim.g.autoformat_autoindent = 0
vim.g.autoformat_retab = 0
vim.g.autoformat_remove_trailing_spaces = 0
vim.cmd([[
let g:formatdef_astyle = '"astyle --indent=spaces=2 --max-code-length=70 -xW -A2 -xp -o -C -xt -L -w -Y -M -xd -k1 -p -E"'
let g:formatdef_astyle_java = '"astyle --align-pointer=middle --delete-empty-lines --pad-oper --indent=tab "'
let g:formatdef_rustfmt = '"rustfmt --emit=stdout"'
let g:formatdef_luaformat = "'stylua --search-parent-directories --stdin-filepath ' . expand('%:p') .' -- -'"

let g:formatters_c = ['astyle']
let g:formatters_cpp = ["astyle"]
let g:formatters_java = ["astyle_java"]
let g:formatters_rust = ["rustfmt"]
let g:formatters_lua = ["luaformat"]
]])
