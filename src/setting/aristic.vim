"== 自动格式化
let g:formatdef_my_c = '"astyle --align-pointer=middle --delete-empty-lines --pad-oper --attach-closing-while"'
let g:formatdef_my_java = '"astyle --align-pointer=middle --delete-empty-lines --pad-oper --indent=tab "'
let g:formatters_c = ['my_c']
let g:formatters_cpp= ['my_c']
let g:formatters_java = ['my_java']
let g:autoformat_verbosemode=1
au BufWrite *.c,*.cpp,*.java :Autoformat
