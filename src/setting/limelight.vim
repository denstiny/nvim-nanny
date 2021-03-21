"=== 自动切换工作目录

autocmd BufEnter * silent! :lcd%:p:h
autocmd VimLeave * silent! :lcd-

