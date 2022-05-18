"=== 自动清理命令行
"function! s:empty_message(timer)
"  if mode() ==# 'n'
"    echon ''
"  endif
"endfunction
"
"augroup cmd_msg_cls
"  autocmd!
"  "autocmd CursorMoved :  call timer_start(10, funcref('s:empty_message'))
"  autocmd CursorMoved : echon ''
"augroup END

" 高亮指定行
"call nvim_buf_add_highlight(0, -1, "GitSignsAddInline", 1, 0, -1)
