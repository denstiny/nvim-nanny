"=== 自动切换工作目录

autocmd VimEnter * silent! :lcd%:p:h
autocmd VimLeave * silent! :lcd-

