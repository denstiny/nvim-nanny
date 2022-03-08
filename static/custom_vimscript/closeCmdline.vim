"=== 自动清理命令行
function! s:empty_message(timer)
  if mode() ==# 'n'
    echon ''
  endif
endfunction

augroup cmd_msg_cls
    autocmd!
    autocmd CmdlineLeave :  call timer_start(10000, funcref('s:empty_message'))
augroup END

" 高亮指定行
"call nvim_buf_add_highlight(0, -1, "GitSignsAddInline", 1, 0, -1)
