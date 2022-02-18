"== 自动格式化
let g:formatdef_my_c = '"astyle -A14 --indent=spaces=4 -C -p -f"'
let g:formatters_c = ['my_c']
let g:formatters_cpp= ['my_c']
let g:autoformat_verbosemode=1
au BufWrite *.c,*.cpp,*.java :Autoformat
