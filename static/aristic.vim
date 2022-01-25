"== 自动格式化
let g:formatdef_my_c = '"astyle --align-pointer=middle --delete-empty-lines --pad-oper --attach-closing-while --indent-classes -xV -C -A14"'
let g:formatters_c = ['my_c']
let g:formatters_cpp= ['my_c']
let g:autoformat_verbosemode=1
au BufWrite *.c,*.cpp,*.java :Autoformat
